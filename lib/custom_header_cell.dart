import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_header_cell_item.dart';

class CustomHeaderCell extends StatelessWidget {
  final String id;
  final String title;
  final double? width;
  final Function(double, String, double)? onDragUpdate;
  const CustomHeaderCell({super.key, required this.id, required this.title, this.width, this.onDragUpdate});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: SizedBox(
        width: width,
        child: CustomHeaderCellItem(id: id, title: title, onDragUpdate: onDragUpdate),
      ),
    );
  }
}
