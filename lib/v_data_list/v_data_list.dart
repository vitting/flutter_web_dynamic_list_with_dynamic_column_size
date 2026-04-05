import 'package:flutter/material.dart' hide DataRow;
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/footer/v_data_list_footer.dart';
import 'package:v_data_list/v_data_list/header/v_data_list_header.dart';
import 'package:v_data_list/v_data_list/resize_handler/v_data_list_resizable_handler.dart';
import 'package:v_data_list/v_data_list/row/v_data_list_row.dart';
import 'package:v_data_list/v_data_list/total_count/v_data_list_total_count.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class VDataList extends StatefulWidget {
  final void Function(VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)? onRowTap;
  final void Function(ColumnDefinitionMap updatedColumnDefs)? onColumnDefsChanged;
  final void Function(String id, ColumnSortState sortState, ColumnDefinitionMap updatedColumnDefs)? onSortChanged;
  final void Function(VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPress;
  final void Function(String id, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPressRow;
  final void Function(String id, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)?
  onLongPressRowCopyValue;

  /// The column definitions for the list, which define the columns to display and their properties such as width and sort state.
  /// The keys of the column definitions should match the keys in the data rows to display the correct data in each column.
  final ColumnDefinitionMap columnDefs;

  /// The data to display in the list, where each DataRow represents a row of data and should contain keys that match the column definitions.
  /// The list will display the values from the data rows according to the column definitions, and any updates to the data will be reflected in the list.
  final VDataListDataRowList data;

  /// The configuration for the list, which includes various settings for the appearance and behavior of the list such as header and row styling.
  final VDataListConfig config;

  // TODO: Implement
  final bool isLoading;
  // TODO: Implement
  final void Function()? onLoadMore;

  /// An optional total number of items to display in the total count widget when [showTotalCount] is true.
  final int totalItems;

  /// An optional widget to display as the footer of the list when [showFooter] is true.
  /// This widget will be displayed below the list content and can be used to show additional information or actions related to the list.
  /// If null, no footer will be displayed.
  final Widget? footer;

  /// If provided, this widget will be used as the resize handler for column resizing instead of the default [VDataListResizableHandler].
  /// This allows for custom styling and behavior of the resize handler.
  /// If null, the default [VDataListResizableHandler] will be used.
  final Widget? resizeHandler;

  const VDataList({
    super.key,
    required this.columnDefs,
    this.data = const [],
    this.onLoadMore,
    this.isLoading = false,
    required this.totalItems,
    this.onRowTap,
    this.onColumnDefsChanged,
    this.onSortChanged,
    this.onLongPress,
    required this.config,
    this.footer,
    this.resizeHandler,
    this.onLongPressRow,
    this.onLongPressRowCopyValue,
  });

  @override
  State<VDataList> createState() => _VDataListState();
}

class _VDataListState extends State<VDataList> {
  bool _hasTriggeredLoadMore = false;
  final ScrollController _horizontalController = ScrollController();
  late ColumnDefinitionMap _localColumnDefs;
  final ScrollController _verticalController = ScrollController();
  bool _loadMoreData = false;

  @override
  void didUpdateWidget(VDataList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.length != widget.data.length) {
      // Reset the load more trigger when new data is loaded
      _hasTriggeredLoadMore = false;
      // Update the load more data flag based on the new data length and total items
      _loadMoreData = widget.data.length < widget.totalItems;
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
    _loadMoreData = widget.data.length < widget.totalItems;
  }

  void _onScroll() {
    if (_verticalController.hasClients && widget.onLoadMore != null && !widget.isLoading) {
      final scrollPosition = _verticalController.position;
      final scrollPercentage = scrollPosition.pixels / scrollPosition.maxScrollExtent;

      if (scrollPercentage >= 0.5 && _loadMoreData && !_hasTriggeredLoadMore) {
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

  Widget _buildRow(VDataListDataRow data, bool isEven) {
    final rowContent = VDataListRow(
      columnDefs: _localColumnDefs,
      data: data,
      isEven: isEven,
      showTooltip: widget.config.showTooltip,
      onRowTap: (rowData) {
        widget.onRowTap?.call(rowData, _localColumnDefs);
      },
      longPressToCopyCellValueToClipboard: widget.config.longPressToCopyCellValueToClipboard,
      rowPadding: widget.config.rowPadding,
      rowSpacing: widget.config.rowSpacing,
      borderRadius: widget.config.rowBorderRadius,
      showEvenBackgroundColor: true,
      showHoverBackgroundColor: true,
      showRowClickHandler: widget.config.showRowClickHandler,
      rowClickHandlerIcon: widget.config.rowClickHandlerIcon,
      rowClickHandlerWidth: widget.config.rowClickHandlerWidth,
      triggerOnRowTapWhenRowClickHandlerIsShown: widget.config.triggerOnRowTapWhenRowClickHandlerIsShown,
      tooltipBorderRadius: widget.config.tooltipBorderRadius,
      onLongPress: widget.onLongPressRow,
      onLongPressCopy: widget.onLongPressRowCopyValue,
    );

    if (widget.config.textIsSelectable) {
      return SelectionArea(child: rowContent);
    } else {
      return rowContent;
    }
  }

  Widget get _buildTotalCount {
    return VDataListTotalCount(
      total: widget.totalItems,
      borderRadius: widget.config.totalCountBorderRadius,
      horizontalPadding: widget.config.rowPadding.horizontal / 2,
      totalCountBottomSpacing: widget.config.totalCountBottomSpacing,
    );
  }

  Widget _buildSliverAppbar() {
    return VDataListHeader(
      columnDefs: _localColumnDefs,
      useExpanded: true,
      resizeHandler:
          widget.resizeHandler ??
          VDataListResizableHandler(
            icon: widget.config.resizeHandlerIcon,
            margin: widget.config.resizeHandlerMargin,
            padding: widget.config.resizeHandlerPadding,
          ),
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
            shrinkWrap: true,
            controller: _verticalController,
            slivers: [
              if (widget.config.showTotalCount && widget.config.totalItemsPosition == TotalCountPosition.top) _buildTotalCount,
              SliverPadding(
                padding: EdgeInsets.only(bottom: widget.config.headerBottomSpacing),
                sliver: _buildSliverAppbar(),
              ),
              if (widget.config.showTotalCount && widget.config.totalItemsPosition == TotalCountPosition.bottom) _buildTotalCount,
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
                  child: VDataListFooter(
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
          VDataListFooter(
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
