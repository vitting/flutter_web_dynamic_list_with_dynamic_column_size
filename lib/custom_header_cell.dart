import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_header_cell_item.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomHeaderCell extends StatelessWidget {
  final String id;
  final String title;
  final double? width;
  final bool isResizable;
  final ColumnSortState sortState;
  final Function(double, String, double)? onDragUpdate;
  final Function(String id, ColumnSortState sortState)? onSortTap;
  const CustomHeaderCell({
    super.key,
    required this.id,
    required this.title,
    this.width,
    this.onDragUpdate,
    this.isResizable = true,
    this.onSortTap,
    this.sortState = ColumnSortState.none,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: SizedBox(
        width: width,
        child: CustomHeaderCellItem(
          id: id,
          title: title,
          onDragUpdate: onDragUpdate,
          isResizable: isResizable,
          onSortTap: onSortTap,
          sortState: sortState,
        ),
      ),
    );
  }
}
