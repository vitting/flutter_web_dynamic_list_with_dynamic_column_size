import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_header_cell.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';

class CustomHeader extends StatelessWidget {
  final bool useExpanded;
  final Function(double, String, double)? onDragUpdate;
  final ColumnDefinitionMap columnDefs;
  const CustomHeader({super.key, this.useExpanded = false, this.onDragUpdate, this.columnDefs = const {}});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: columnDefs.entries.map((entry) {
        final columnDef = entry.value;
        return CustomHeaderCell(id: columnDef.id, title: columnDef.label, width: columnDef.width, onDragUpdate: onDragUpdate);
      }).toList(),
    );
  }
}
