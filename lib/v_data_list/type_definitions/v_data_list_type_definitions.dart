import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/column_definition.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/footer/v_data_list_footer.dart';
import 'package:v_data_list/v_data_list/header/v_data_list_header.dart';
import 'package:v_data_list/v_data_list/no_data/v_data_list_no_data.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_data.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_style.dart';
import 'package:v_data_list/v_data_list/row/v_data_list_row.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/total_count/v_data_list_total_count.dart';

/// A typedef for the column definition map, which is a map where
/// the key is the column ID and the value is the ColumnDefinition object for that column
typedef ColumnDefinitionMap = Map<String, ColumnDefinition>;

/// A typedef for a single entry in the column definition map,
/// which is a MapEntry where the key is the column ID and the value
/// is the ColumnDefinition object for that column
typedef ColumnDefinitionMapEntry = MapEntry<String, ColumnDefinition>;

/// A typedef for the data row, which is a map where the key is the
/// column ID and the value is the cell value for that column in that row
typedef VDataListDataRow = Map<String, VDataListRowCellData>;

/// A typedef for the list of data rows, which is a list of DataRow objects
typedef VDataListDataRowList = List<VDataListDataRow>;

typedef VDataListRowCellStyleBuilder =
    VDataListRowCellStyle? Function(
      BuildContext context,
      String columnId,
      VDataListRowCellData cellData,
      ColumnDefinition columnDefinition,
    );

typedef VDataListRowBuilder =
    VDataListRow? Function(
      BuildContext context,
      VDataListDataRow data,
      ColumnDefinitionMap columnDefinitions,
      VDataListConfig config,
      VDataListRowCellStyleBuilder? rowCellStyleBuilder,
      int index,
      bool isEven,
    );

typedef VDataListOnRowTap = void Function(VDataListDataRow data, ColumnDefinitionMap updatedColumnDefinitions);

typedef VDataListonColumnDefsChanged = void Function(ColumnDefinitionMap updatedColumnDefinitions);

typedef VDataListOnSortChanged =
    void Function(String columnId, ColumnSortState sortState, ColumnDefinitionMap updatedColumnDefinitions);

typedef VDataListOnLongPressRow =
    void Function(String columnId, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefinitions);

typedef VDataListOnLongPressRowCopyValue =
    void Function(String id, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefinitions);

typedef VDataListHeaderBuilder =
    VDataListHeader Function(
      BuildContext context,
      ColumnDefinitionMap columnDefintionMap,
      VDataListConfig config,
      Widget? resizeHandler,
      void Function(String columnId, ColumnSortState sortState)? onSortChanged,
      void Function(String columnId)? onDragHandlerLongPress,
      void Function(String, double, double)? onDragUpdate,
    );

typedef VDataListOnPaginationIndexChanged = void Function(int page, int totalItems, int pageSize);

typedef VDataListOnLoadMore = void Function();

typedef VDataListResetWidthDialogBuilder = Widget? Function(BuildContext context, VDataListConfig config);

typedef VDataListNoDataBuilder = VDataListNoData? Function(BuildContext context, VDataListConfig config, NoDataTheme? theme);

typedef VDataListFooterBuilder =
    VDataListFooter? Function(BuildContext context, VDataListConfig config, Widget? child, FooterTheme? theme);

typedef VDataListTotalCountBuilder =
    VDataListTotalCount? Function(BuildContext context, VDataListConfig config, int? total, TotalCountTheme? theme);

typedef VDataListLoadMoreDataSpinnerBuilder = Widget? Function(BuildContext context, VDataListConfig config);

typedef VDataListPaginationBuilder =
    Widget? Function(
      BuildContext context,
      VDataListConfig config,
      int currentPage,
      int pageSize,
      int totalItems,
      VDataListOnPaginationIndexChanged? onPaginationIndexChanged,
    );
