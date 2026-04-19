import 'package:flutter/material.dart' hide DataRow;
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/footer/v_data_list_footer.dart';
import 'package:v_data_list/v_data_list/header/v_data_list_header.dart';
import 'package:v_data_list/v_data_list/no_data/v_data_list_no_data.dart';
import 'package:v_data_list/v_data_list/pagination/v_data_list_pagination.dart';
import 'package:v_data_list/v_data_list/resize_handler/v_data_list_resizable_handler.dart';
import 'package:v_data_list/v_data_list/row/v_data_list_row.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/total_count/v_data_list_total_count.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class VDataList extends StatefulWidget {
  final VDataListOnRowTap? onRowTap;
  final VDataListonColumnDefsChanged? onColumnDefsChanged;
  final VDataListOnSortChanged? onSortChanged;
  final VDataListOnLongPressRow? onLongPressRow;
  final VDataListOnLongPressRowCopyValue? onLongPressRowCopyValue;

  /// An optional callback that is triggered when the user scrolls to the end of the list,
  /// which can be used to load more data into the list.
  final void Function()? onLoadMore;

  /// An optional callback that is triggered when the pagination index changes, providing the new page index, total items, and page size.
  final void Function(int page, int totalItems, int pageSize)? onPaginationIndexChanged;

  /// An cell Style builder to override the default cell style for specific cells based on the column id and cell data.
  /// This allows for dynamic styling of cells based on their content or column.
  final VDataListRowCellStyleBuilder? rowCellStyleBuilder;

  /// The column definitions for the list, which define the columns to display and their properties such as width and sort state.
  /// The keys of the column definitions should match the keys in the data rows to display the correct data in each column.
  final ColumnDefinitionMap columnDefinitions;

  /// The configuration for the list, which includes various settings for the appearance and behavior of the list such as header and row styling.
  final VDataListConfig config;

  /// The data to display in the list, where each DataRow represents a row of data and should contain keys that match the column definitions.
  /// The list will display the values from the data rows according to the column definitions, and any updates to the data will be reflected in the list.
  final VDataListDataRowList data;

  /// An optional widget to display as the footer of the list when [showFooter] is true.
  /// This widget will be displayed below the list content and can be used to show additional information or actions related to the list.
  /// If null, no footer will be displayed.
  final Widget? footer;

  /// A flag indicating whether the list is currently loading more data,
  /// which can be used to show a loading indicator at the end of the list when more data is being loaded.
  final bool isLoading;

  /// An optional current page index to display in the pagination widget when [showPagination] is true.
  /// This should be a zero-based index, where 0 represents the first page.
  /// If null, the pagination widget will default to showing the first page as selected.
  final int? paginationCurrentPage;

  /// An optional total count of items to display in the pagination widget when [showPagination] is true.
  final int? paginationItemsPerPage;

  /// If provided, this widget will be used as the resize handler for column resizing instead of the default [VDataListResizableHandler].
  /// This allows for custom styling and behavior of the resize handler.
  /// If null, the default [VDataListResizableHandler] will be used.
  final Widget? resizeHandler;

  /// An optional widget to display in the total count area when [showTotalCount] is true.
  final Widget? totalCount;

  /// An optional total number of items to display in the total count widget when [showTotalCount] is true.
  final int totalItems;

  /// An optional widget to display when there is no data to show in the list and [noDataMessage] is set in the config.
  final Widget? noData;

  /// An optional custom row builder that can be used to build custom row widgets instead of the default [VDataListRow].
  final VDataListRowBuilder? rowBuilder;

  /// An optional custom header builder that can be used to build a custom header widget instead of the default [VDataListHeader].
  final VDataListHeaderBuilder? headerBuilder;

  const VDataList({
    super.key,
    required this.columnDefinitions,
    this.data = const [],
    this.onLoadMore,
    this.isLoading = false,
    required this.totalItems,
    this.onRowTap,
    this.onColumnDefsChanged,
    this.onSortChanged,
    required this.config,
    this.footer,
    this.resizeHandler,
    this.onLongPressRow,
    this.onLongPressRowCopyValue,
    this.totalCount,
    this.paginationItemsPerPage,
    this.onPaginationIndexChanged,
    this.paginationCurrentPage,
    this.rowCellStyleBuilder,
    this.noData,
    this.rowBuilder,
    this.headerBuilder,
  });

  @override
  State<VDataList> createState() => _VDataListState();
}

class _VDataListState extends State<VDataList> {
  bool _hasTriggeredLoadMore = false;
  final ScrollController _horizontalController = ScrollController();
  bool _loadMoreData = false;
  late ColumnDefinitionMap _localColumnDefinitions;
  final ScrollController _verticalController = ScrollController();

  @override
  void didUpdateWidget(VDataList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.length != widget.data.length) {
      // Reset the load more trigger when new data is loaded
      _hasTriggeredLoadMore = false;
      // Update the load more data flag based on the new data length and total items
      _loadMoreData = widget.data.length < widget.totalItems;
    }

    if (oldWidget.columnDefinitions != widget.columnDefinitions) {
      _localColumnDefinitions = {...widget.columnDefinitions};
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
    _localColumnDefinitions = {...widget.columnDefinitions};
    _verticalController.addListener(_onScroll);
    _loadMoreData = widget.data.length < widget.totalItems;
  }

  void _onScroll() {
    if (_verticalController.hasClients && widget.onLoadMore != null && !widget.isLoading) {
      final scrollPosition = _verticalController.position;
      final scrollPercentage = scrollPosition.pixels / scrollPosition.maxScrollExtent;

      if (scrollPercentage >= widget.config.loadMoreThresholdScrollDistance && _loadMoreData && !_hasTriggeredLoadMore) {
        _hasTriggeredLoadMore = true;
        widget.onLoadMore!();
      }
    }
  }

  void _updateColumnWidth(String columnId, double delta, currentColumnWidth) {
    setState(() {
      if (currentColumnWidth != null) {
        final newWidth = (currentColumnWidth ?? 100) + delta;
        _localColumnDefinitions = {
          ..._localColumnDefinitions,
          columnId: _localColumnDefinitions[columnId]!.setWidth(newWidth.clamp(100, 500)),
        };
      } else {
        _localColumnDefinitions = {..._localColumnDefinitions, columnId: _localColumnDefinitions[columnId]!.setWidth(null)};
      }

      widget.onColumnDefsChanged?.call(_localColumnDefinitions);
    });
  }

  // Calculate the total width needed for all columns
  double get _totalWidth {
    double totalWidth = 0;
    for (var columnDefinition in _localColumnDefinitions.values) {
      // Default width if null
      totalWidth += columnDefinition.width ?? 100;
    }

    // Add some padding to prevent scrollbar from overlapping content
    totalWidth += 100;
    return totalWidth;
  }

  void _sortChanged(String columnId, ColumnSortState sortState) {
    setState(() {
      _localColumnDefinitions = _localColumnDefinitions.map((key, value) {
        if (key == columnId) {
          return MapEntry(key, value.copyWith(sortState: sortState));
        } else {
          return MapEntry(key, value.copyWith(sortState: ColumnSortState.none));
        }
      });

      widget.onColumnDefsChanged?.call(_localColumnDefinitions);
      widget.onSortChanged?.call(columnId, sortState, _localColumnDefinitions);
    });
  }

  Widget _buildRow(VDataListDataRow data, bool isEven, int index) {
    final customRow = widget.rowBuilder?.call(
      context,
      data,
      _localColumnDefinitions,
      widget.config,
      widget.rowCellStyleBuilder,
      index,
      isEven,
    );

    final rowContent =
        customRow ??
        VDataListRow(
          columnDefinitions: _localColumnDefinitions,
          rowData: data,
          config: widget.config,
          isEven: isEven,
          rowCellStyleBuilder: widget.rowCellStyleBuilder,
          onRowTap: widget.onRowTap,
          onLongPressRow: widget.onLongPressRow,
          onLongPressRowCopyValue: widget.onLongPressRowCopyValue,
        );

    if (widget.config.textIsSelectable) {
      return SelectionArea(child: rowContent);
    } else {
      return rowContent;
    }
  }

  Widget get _buildTotalCount {
    return VDataListTotalCount(total: widget.totalItems, config: widget.config, child: widget.totalCount);
  }

  void _dragHandlerLongPress(String columnId) async {
    if (widget.config.canResetColumnWidthOnLongPress) {
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          // TODO: Theme and config
          // TODO: Localize
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
        _updateColumnWidth(columnId, 0, null);
      }
    }
  }

  Widget _buildSliverAppbar() {
    final customHeader = widget.headerBuilder?.call(
      context,
      _localColumnDefinitions,
      widget.config,
      widget.resizeHandler ?? VDataListResizableHandler(config: widget.config),
      _sortChanged,
      _dragHandlerLongPress,
      _updateColumnWidth,
    );
    return customHeader ??
        VDataListHeader(
          config: widget.config,
          columnDefinitions: _localColumnDefinitions,
          resizeHandler: widget.resizeHandler ?? VDataListResizableHandler(config: widget.config),
          onSortTap: _sortChanged,
          onDragHandlerLongPress: _dragHandlerLongPress,
          onDragUpdate: _updateColumnWidth,
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
                VDataListNoData(config: widget.config, child: widget.noData)
              else
                SliverList.builder(
                  itemCount: widget.data.length + (widget.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == widget.data.length) {
                      // Show loading indicator at the end
                      return Container(height: 60, alignment: Alignment.center, child: const CircularProgressIndicator());
                    }
                    final bool isEven = index % 2 == 0;
                    return _buildRow(widget.data[index], isEven, index);
                  },
                ),
              if (widget.footer != null && widget.config.footerPinned == false) SliverToBoxAdapter(child: _buildFooter()),
              if (widget.config.showPagination &&
                  widget.paginationItemsPerPage != null &&
                  widget.paginationCurrentPage != null &&
                  widget.config.paginationPinned == false)
                SliverToBoxAdapter(child: _buildPagination()),
            ],
          ),
        ),
      ),
    );

    if (widget.footer != null && widget.config.footerPinned) {
      body = Column(
        children: [
          Expanded(child: body),
          _buildFooter(),
        ],
      );
    }

    if (widget.config.showPagination &&
        widget.paginationItemsPerPage != null &&
        widget.paginationCurrentPage != null &&
        widget.config.paginationPinned) {
      body = Column(
        children: [
          Expanded(child: body),
          _buildPagination(),
        ],
      );
    }

    return body;
  }

  Widget _buildFooter() {
    return VDataListFooter(config: widget.config, child: widget.footer);
  }

  Widget _buildPagination() {
    return VDataListPagination(
      config: widget.config,
      currentSelectedIndex: widget.paginationCurrentPage ?? 0,
      onPaginationIndexChanged: widget.onPaginationIndexChanged,
      pageSize: widget.paginationItemsPerPage!,
      totalItems: widget.totalItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = VDataListTheme.of(context).backgroundColor;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Material(color: backgroundColor, child: _buildBody(constraints));
      },
    );
  }
}
