import 'package:flutter/material.dart' hide DataRow;
import 'package:web_dynamic_list/custom_header.dart';
import 'package:web_dynamic_list/custom_row.dart';
import 'package:web_dynamic_list/custom_total_count.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomList extends StatefulWidget {
  final void Function(DataRow data, ColumnDefinitionMap updatedColumnDefs)? onRowTap;
  final void Function(ColumnDefinitionMap updatedColumnDefs)? onColumnDefsChanged;
  final void Function(String id, ColumnSortState sortState, ColumnDefinitionMap updatedColumnDefs)? onSortChanged;
  final void Function(DataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPress;
  final ColumnDefinitionMap columnDefs;
  final String? copyCellValueToClipboardMessage;
  final DataRowList data;
  final double headerBottomSpacing;
  final double headerHeight;
  final bool isLoading;
  final bool longPressToCopyCellValueToClipboard;
  final VoidCallback? onLoadMore;
  final double parentPaddingForWidthCalculation;
  final bool pinHeader;
  final EdgeInsetsGeometry rowPadding;
  final double rowSpacing;
  final bool showTooltip;
  final bool textIsSelectable;
  final int? totalItems;
  final CustomListTotalCountPosition totalItemsPosition;

  const CustomList({
    super.key,
    required this.columnDefs,
    this.data = const [],
    this.showTooltip = false,
    this.textIsSelectable = true,
    this.onLoadMore,
    this.isLoading = false,
    this.totalItems,
    this.parentPaddingForWidthCalculation = 16,
    this.longPressToCopyCellValueToClipboard = true,
    this.copyCellValueToClipboardMessage,
    this.onRowTap,
    this.onColumnDefsChanged,
    this.onSortChanged,
    this.rowPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.rowSpacing = 5,
    this.headerHeight = 40,
    this.headerBottomSpacing = 4,
    this.onLongPress,
    this.totalItemsPosition = CustomListTotalCountPosition.bottom,
    this.pinHeader = true,
  });

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  bool _hasTriggeredLoadMore = false;
  final ScrollController _horizontalController = ScrollController();
  late ColumnDefinitionMap _localColumnDefs;
  final ScrollController _verticalController = ScrollController();

  @override
  void didUpdateWidget(CustomList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.length != widget.data.length) {
      // Reset the load more trigger when new data is loaded
      _hasTriggeredLoadMore = false;
    }
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _localColumnDefs = {...widget.columnDefs};
    _verticalController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_verticalController.hasClients && widget.onLoadMore != null && !widget.isLoading) {
      final scrollPosition = _verticalController.position;
      final scrollPercentage = scrollPosition.pixels / scrollPosition.maxScrollExtent;

      if (scrollPercentage >= 0.5 && !_hasTriggeredLoadMore) {
        _hasTriggeredLoadMore = true;
        widget.onLoadMore!();
      }
    }
  }

  void _updateColumnWidth(String id, double delta, currentColumnWidth) {
    setState(() {
      if (currentColumnWidth != null) {
        final newWidth = (currentColumnWidth ?? 100) + delta;
        _localColumnDefs = {..._localColumnDefs, id: _localColumnDefs[id]!.setWidth(newWidth.clamp(100, 500))};
      } else {
        _localColumnDefs = {..._localColumnDefs, id: _localColumnDefs[id]!.setWidth(null)};
      }

      widget.onColumnDefsChanged?.call(_localColumnDefs);
    });
  }

  // Calculate the total width needed for all columns
  double get _totalWidth {
    double totalWidth = 0;
    for (var columnDef in _localColumnDefs.values) {
      totalWidth += columnDef.width ?? 100; // Default width if null
    }

    totalWidth += 100; // Add some padding to prevent scrollbar from overlapping content
    return totalWidth;
  }

  void _sortChanged(String id, ColumnSortState sortState) {
    setState(() {
      _localColumnDefs = _localColumnDefs.map((key, value) {
        if (key == id) {
          return MapEntry(key, value.copyWith(sortState: sortState));
        } else {
          return MapEntry(key, value.copyWith(sortState: ColumnSortState.none));
        }
      });

      widget.onColumnDefsChanged?.call(_localColumnDefs);
      widget.onSortChanged?.call(id, sortState, _localColumnDefs);
    });
  }

  Widget _buildRow(DataRow data, bool isEven, bool textIsSelectable) {
    final rowContent = CustomRow(
      columnDefs: _localColumnDefs,
      data: data,
      isEven: isEven,
      showTooltip: widget.showTooltip,
      onRowTap: (rowData) {
        widget.onRowTap?.call(rowData, _localColumnDefs);
      },
      longPressToCopyCellValueToClipboard: widget.longPressToCopyCellValueToClipboard,
      copyCellValueToClipboardMessage: widget.copyCellValueToClipboardMessage,
      rowPadding: widget.rowPadding,
      rowSpacing: widget.rowSpacing,
      showEvenBackgroundColor: true,
      showHoverBackgroundColor: true,
    );

    if (textIsSelectable) {
      return SelectionArea(child: rowContent);
    } else {
      return rowContent;
    }
  }

  Widget _buildTotalCount() {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 4),
      sliver: SliverToBoxAdapter(
        child: widget.totalItems != null
            ? CustomTotalCount(
                total: widget.totalItems!,
                backgroundColor: Colors.grey.shade800,
                horizontalPadding: widget.rowPadding.horizontal / 2,
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _horizontalController,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: _totalWidth.clamp(MediaQuery.of(context).size.width - widget.parentPaddingForWidthCalculation, double.infinity),
          child: CustomScrollView(
            controller: _verticalController,
            shrinkWrap: true,
            slivers: [
              if (widget.totalItems != null && widget.totalItemsPosition == CustomListTotalCountPosition.top) _buildTotalCount(),
              SliverPadding(
                padding: EdgeInsets.only(bottom: widget.headerBottomSpacing),
                sliver: SliverAppBar(
                  pinned: widget.pinHeader,
                  backgroundColor: Colors.grey.shade800,
                  forceElevated: false,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  surfaceTintColor: Colors.transparent,
                  toolbarHeight: widget.headerHeight,
                  titleSpacing: 0,
                  titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widget.rowPadding.horizontal / 2),
                    child: CustomHeader(
                      columnDefs: _localColumnDefs,
                      useExpanded: true,
                      onSortTap: _sortChanged,
                      onDragHandlerLongPress: (id) async {
                        final result = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Reset Column Width'),
                            content: Text('Do you want to reset the width of this column to default?'),
                            actions: [
                              TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('Cancel')),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('Reset'),
                              ),
                            ],
                          ),
                        );
                        if (result == true) {
                          _updateColumnWidth(id, 0, null);
                        }
                      },
                      onDragUpdate: (delta, id, currentWidth) {
                        _updateColumnWidth(id, delta, currentWidth);
                      },
                      // totalItems: widget.totalItems,
                    ),
                  ),
                ),
              ),
              if (widget.totalItems != null && widget.totalItemsPosition == CustomListTotalCountPosition.bottom)
                _buildTotalCount(),
              SliverList.builder(
                itemCount: widget.data.length + (widget.isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == widget.data.length) {
                    // Show loading indicator at the end
                    return Container(height: 60, alignment: Alignment.center, child: const CircularProgressIndicator());
                  }
                  final bool isEven = index % 2 == 0;
                  return _buildRow(widget.data[index], isEven, widget.textIsSelectable);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
