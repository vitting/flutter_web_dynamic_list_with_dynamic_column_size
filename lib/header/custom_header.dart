import 'package:flutter/material.dart';
import 'package:web_dynamic_list/header/custom_header_cell.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomHeader extends StatelessWidget {
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
  final double borderRadiusHeader;
  final EdgeInsetsGeometry headerPadding;
  final bool showSortIconsInHeader;

  const CustomHeader({
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
    this.borderRadiusHeader = 8,
    this.headerPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.showSortIconsInHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: Material(
        child: Container(
          padding: headerPadding,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.all(Radius.circular(borderRadiusHeader)),
          ),
          child: Row(
            children: [
              ...columnDefs.entries.map((entry) {
                final columnDef = entry.value;
                return CustomHeaderCell(
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
                );
              }),
              if (showRowClickHandler)
                CustomHeaderCell(
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
