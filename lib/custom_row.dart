import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_row_cell.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';

class CustomRow extends StatelessWidget {
  final ColumnDefinitionMap columnDefs;
  final Map<String, String> data;
  const CustomRow({super.key, required this.columnDefs, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Colors.grey.shade600,
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: columnDefs.entries.map((entry) {
          final columnDef = entry.value;
          return CustomRowCell(id: columnDef.id, value: data[columnDef.id] ?? '', width: columnDef.width);
        }).toList(),
      ),
    );
  }
}
