import 'package:flutter/material.dart' hide DataRow;
import 'package:web_dynamic_list/footer/custom_footer.dart';
import 'package:web_dynamic_list/header/custom_header.dart';
import 'package:web_dynamic_list/config/custom_list_config.dart';
import 'package:web_dynamic_list/row/custom_row.dart';
import 'package:web_dynamic_list/total_count/custom_total_count.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomList extends StatefulWidget {
  final void Function(DataRow data, ColumnDefinitionMap updatedColumnDefs)? onRowTap;
  final void Function(ColumnDefinitionMap updatedColumnDefs)? onColumnDefsChanged;
  final void Function(String id, ColumnSortState sortState, ColumnDefinitionMap updatedColumnDefs)? onSortChanged;
  final void Function(DataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPress;
  final ColumnDefinitionMap columnDefs;
  final DataRowList data;
  final bool isLoading;
  final VoidCallback? onLoadMore;
  final int? totalItems;
  final CustomListConfig config;
  final Widget? footer;

  const CustomList({
    super.key,
    required this.columnDefs,
    this.data = const [],
    this.onLoadMore,
    this.isLoading = false,
    this.totalItems,
    this.onRowTap,
    this.onColumnDefsChanged,
    this.onSortChanged,
    this.onLongPress,
    required this.config,
    this.footer,
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
      // Default width if null
      totalWidth += columnDef.width ?? 100;
    }

    // Add some padding to prevent scrollbar from overlapping content
    totalWidth += 100;
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

  Widget _buildRow(DataRow data, bool isEven) {
    final rowContent = CustomRow(
      columnDefs: _localColumnDefs,
      data: data,
      isEven: isEven,
      showTooltip: widget.config.showTooltip,
      onRowTap: (rowData) {
        widget.onRowTap?.call(rowData, _localColumnDefs);
      },
      longPressToCopyCellValueToClipboard: widget.config.longPressToCopyCellValueToClipboard,
      copyCellValueToClipboardMessage: widget.config.copyCellValueToClipboardMessage,
      rowPadding: widget.config.rowPadding,
      rowSpacing: widget.config.rowSpacing,
      borderRadius: widget.config.rowBorderRadius,
      showEvenBackgroundColor: true,
      showHoverBackgroundColor: true,
      showRowClickHandler: widget.config.showRowClickHandler,
      rowClickHandlerIcon: widget.config.rowClickHandlerIcon,
      rowClickHandlerWidth: widget.config.rowClickHandlerWidth,
      triggerOnRowTapWhenRowClickHandlerIsShown: widget.config.triggerOnRowTapWhenRowClickHandlerIsShown,
    );

    if (widget.config.textIsSelectable) {
      return SelectionArea(child: rowContent);
    } else {
      return rowContent;
    }
  }

  Widget get _buildTotalCount {
    return CustomTotalCount(
      total: widget.totalItems!,
      borderRadius: widget.config.totalCountBorderRadius,
      backgroundColor: Colors.grey.shade800,
      horizontalPadding: widget.config.rowPadding.horizontal / 2,
      totalCountBottomSpacing: widget.config.totalCountBottomSpacing,
    );
  }

  Widget _buildSliverAppbar() {
    return CustomHeader(
      columnDefs: _localColumnDefs,
      useExpanded: true,
      resizeHandler: widget.config.resizeHandler,
      pinHeader: widget.config.pinHeader,
      borderRadiusHeader: widget.config.headerBorderRadius,
      headerPadding: widget.config.headerPadding,
      onSortTap: _sortChanged,
      sortIconAscending: widget.config.sortIconAscending,
      sortIconDescending: widget.config.sortIconDescending,
      showSortIconsInHeader: widget.config.showSortIconsInHeader,
      showRowClickHandler: widget.config.showRowClickHandler,
      rowClickHandlerWidth: widget.config.rowClickHandlerWidth,
      onDragHandlerLongPress: (id) async {
        if (widget.config.canResetColumnWidthOnLongPress) {
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
        }
      },
      onDragUpdate: (delta, id, currentWidth) {
        _updateColumnWidth(id, delta, currentWidth);
      },
      // totalItems: widget.totalItems,
    );
  }

  Widget _buildBody(BoxConstraints constraints) {
    Widget body = Scrollbar(
      controller: _horizontalController,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: _totalWidth.clamp(constraints.maxWidth, double.infinity),
          child: CustomScrollView(
            controller: _verticalController,
            slivers: [
              if (widget.totalItems != null && widget.config.totalItemsPosition == CustomListTotalCountPosition.top)
                _buildTotalCount,
              SliverPadding(
                padding: EdgeInsets.only(bottom: widget.config.headerBottomSpacing),
                sliver: _buildSliverAppbar(),
              ),
              if (widget.totalItems != null && widget.config.totalItemsPosition == CustomListTotalCountPosition.bottom)
                _buildTotalCount,
              if (widget.config.noDataMessage != null && widget.data.isEmpty && !widget.isLoading)
                SliverFillRemaining(hasScrollBody: false, child: Center(child: Text(widget.config.noDataMessage!)))
              else
                SliverList.builder(
                  itemCount: widget.data.length + (widget.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == widget.data.length) {
                      // Show loading indicator at the end
                      return Container(height: 60, alignment: Alignment.center, child: const CircularProgressIndicator());
                    }
                    final bool isEven = index % 2 == 0;
                    return _buildRow(widget.data[index], isEven);
                  },
                ),
              if (widget.footer != null && widget.config.footerPinned == false)
                SliverToBoxAdapter(
                  child: CustomFooter(
                    footerBorderRadius: widget.config.footerBorderRadius,
                    footerPadding: widget.config.footerPadding,
                    footerMargin: widget.config.footerMargin,
                    child: widget.footer,
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    if (widget.footer != null && widget.config.footerPinned) {
      body = Column(
        children: [
          Expanded(child: body),
          CustomFooter(
            footerBorderRadius: widget.config.footerBorderRadius,
            footerPadding: widget.config.footerPadding,
            footerMargin: widget.config.footerMargin,
            child: widget.footer,
          ),
        ],
      );
    }

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _buildBody(constraints);
      },
    );
  }
}
