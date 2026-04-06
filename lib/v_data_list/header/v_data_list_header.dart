import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/header/v_data_list_header_cell.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class VDataListHeader extends StatelessWidget {
  final void Function(double delta, String id, double currentWidth)? onDragUpdate;
  final void Function(String id, ColumnSortState sortState)? onSortTap;
  final void Function(String id)? onDragHandlerLongPress;
  final ColumnDefinitionMap columnDefs;
  final Widget? resizeHandler;
  final VDataListConfig config;

  const VDataListHeader({
    super.key,
    required this.config,
    this.onDragUpdate,
    this.columnDefs = const {},
    this.onSortTap,
    this.onDragHandlerLongPress,
    this.resizeHandler,
  });

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).headerTheme;
    return PinnedHeaderSliver(
      child: Material(
        child: Container(
          padding: config.headerPadding,
          decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.headerBorderRadius),
          child: Row(
            children: [
              ...columnDefs.entries.map((entry) {
                final columnDef = entry.value;
                return VDataListHeaderCell(
                  id: columnDef.id,
                  title: columnDef.label,
                  width: columnDef.width,
                  onDragUpdate: onDragUpdate,
                  isResizable: columnDef.isResizable,
                  onSortTap: onSortTap,
                  sortState: columnDef.sortState,
                  onDragHandlerLongPress: onDragHandlerLongPress,
                  sortIconAscending: config.sortIconAscending,
                  sortIconDescending: config.sortIconDescending,
                  showSortIconsInHeader: config.showSortIconsInHeader,
                  resizeHandler: resizeHandler,
                  textStyle: theme.textStyle,
                );
              }),
              if (config.showRowClickHandler)
                VDataListHeaderCell(
                  id: '_trigger_cell_vlist_2000',
                  title: '',
                  width: config.rowClickHandlerWidth,
                  isResizable: false,
                  showSortIconsInHeader: false,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
