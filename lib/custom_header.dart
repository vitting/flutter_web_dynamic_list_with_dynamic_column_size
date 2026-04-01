import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_header_cell.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomHeader extends StatelessWidget {
  final bool useExpanded;
  final Function(double, String, double)? onDragUpdate;
  final ColumnDefinitionMap columnDefs;
  final Function(String id, ColumnSortState sortState)? onSortTap;
  const CustomHeader({super.key, this.useExpanded = false, this.onDragUpdate, this.columnDefs = const {}, this.onSortTap});

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
        );
      }).toList(),
    );
  }
}
