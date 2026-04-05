import 'package:flutter/material.dart';
import 'package:v_data_list/header/v_data_list_header_cell.dart';
import 'package:v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list_type_definitions.dart';

class VDataListHeader extends StatelessWidget {
  final void Function(double delta, String id, double currentWidth)? onDragUpdate;
  final void Function(String id, ColumnSortState sortState)? onSortTap;
  final void Function(String id)? onDragHandlerLongPress;
  final ColumnDefinitionMap columnDefs;
  final bool useExpanded;
  final Widget? sortIconAscending;
  final Widget? sortIconDescending;
  final Widget? resizeHandler;
  final bool showRowClickHandler;
  final double rowClickHandlerWidth;
  final bool pinHeader;
  final BorderRadiusGeometry? borderRadiusHeader;
  final EdgeInsetsGeometry? headerPadding;
  final bool showSortIconsInHeader;

  const VDataListHeader({
    super.key,
    this.useExpanded = false,
    this.onDragUpdate,
    this.columnDefs = const {},
    this.onSortTap,
    this.onDragHandlerLongPress,
    this.sortIconAscending,
    this.sortIconDescending,
    this.resizeHandler,
    this.showRowClickHandler = false,
    this.rowClickHandlerWidth = 45,
    this.pinHeader = true,
    this.borderRadiusHeader,
    this.headerPadding,
    this.showSortIconsInHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).headerTheme;
    return PinnedHeaderSliver(
      child: Material(
        child: Container(
          padding: headerPadding,
          decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: borderRadiusHeader),
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
                  sortIconAscending: sortIconAscending,
                  sortIconDescending: sortIconDescending,
                  showSortIconsInHeader: showSortIconsInHeader,
                  resizeHandler: resizeHandler,
                  textStyle: theme.textStyle,
                );
              }),
              if (showRowClickHandler)
                VDataListHeaderCell(
                  id: '_trigger_cell_vlist_2000',
                  title: '',
                  width: rowClickHandlerWidth,
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
