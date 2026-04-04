import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_header_cell.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            resizeHandler: resizeHandler,
          );
        }),
        if (showRowClickHandler)
          CustomHeaderCell(id: '_trigger_cell_vlist', title: '', width: rowClickHandlerWidth, isResizable: false),
      ],
    );
  }
}
