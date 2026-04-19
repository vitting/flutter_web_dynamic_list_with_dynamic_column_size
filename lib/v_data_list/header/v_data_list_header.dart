import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/header/v_data_list_header_cell.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class VDataListHeader extends StatelessWidget {
  final void Function(double delta, String columnId, double currentWidth)? onDragUpdate;
  final void Function(String columnId, ColumnSortState sortState)? onSortTap;
  final void Function(String columnId)? onDragHandlerLongPress;
  final ColumnDefinitionMap columnDefinitions;
  final Widget? resizeHandler;
  final VDataListConfig config;

  const VDataListHeader({
    super.key,
    required this.config,
    this.onDragUpdate,
    this.columnDefinitions = const {},
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
              ...columnDefinitions.entries.map((entry) {
                final columnDefinition = entry.value;
                return VDataListHeaderCell(
                  id: columnDefinition.id,
                  title: columnDefinition.label,
                  width: columnDefinition.width,
                  onDragUpdate: onDragUpdate,
                  isResizable: columnDefinition.isResizable,
                  onSortTap: onSortTap,
                  sortState: columnDefinition.sortState,
                  onDragHandlerLongPress: onDragHandlerLongPress,
                  resizeHandler: resizeHandler,
                  textStyle: theme.textStyle,
                  resizableHandlerPinned: columnDefinition.resizableHandlerPinned,
                );
              }),
              if (config.showRowClickHandler)
                VDataListHeaderCell(
                  id: '_trigger_cell_vlist_2000',
                  title: '',
                  width: config.rowClickHandlerWidth,
                  isResizable: false,
                  showSortIconsInHeader: false,
                  resizableHandlerPinned: false,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
