import 'package:flutter/material.dart' hide DataRow;
import 'package:web_dynamic_list/custom_row_cell.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';

class CustomRow extends StatefulWidget {
  final ColumnDefinitionMap columnDefs;
  final DataRow data;
  final bool isEven;
  final bool showTooltip;
  final Function(DataRow data)? onRowTap;
  const CustomRow({
    super.key,
    required this.columnDefs,
    required this.data,
    this.isEven = false,
    this.onRowTap,
    this.showTooltip = false,
  });

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: _isHovered
            ? Colors.grey.shade400
            : widget.isEven
            ? Colors.grey.shade300
            : Colors.grey.shade200,
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: widget.columnDefs.entries.map((entry) {
            final columnDef = entry.value;
            return CustomRowCell(
              id: columnDef.id,
              value: widget.data[columnDef.id] ?? '',
              width: columnDef.width,
              showTooltip: widget.showTooltip,
            );
          }).toList(),
        ),
      ),
    );
  }
}
