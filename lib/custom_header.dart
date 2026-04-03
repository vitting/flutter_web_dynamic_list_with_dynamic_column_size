import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_header_cell.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomHeader extends StatelessWidget {
  final void Function(double, String, double)? onDragUpdate;
  final void Function(String id, ColumnSortState sortState)? onSortTap;
  final void Function(String id)? onDragHandlerLongPress;
  final ColumnDefinitionMap columnDefs;
  final bool useExpanded;

  const CustomHeader({
    super.key,
    this.useExpanded = false,
    this.onDragUpdate,
    this.columnDefs = const {},
    this.onSortTap,
    this.onDragHandlerLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: columnDefs.entries.map((entry) {
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
        );
      }).toList(),
    );
  }
}
