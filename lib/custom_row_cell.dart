import 'package:flutter/material.dart';

class CustomRowCell extends StatelessWidget {
  final String id;
  final String value;
  final bool showTooltip;
  final double? width;
  final Function(String value)? onLongPressCell;

  const CustomRowCell({
    super.key,
    required this.id,
    required this.value,
    this.width,
    this.showTooltip = false,
    this.onLongPressCell,
  });

  Widget _buildCellContent(BuildContext context) {
    Widget widget = Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.black),
    );

    if (onLongPressCell != null) {
      widget = GestureDetector(
        onLongPress: () {
          onLongPressCell?.call(value);
        },
        child: widget,
      );
    }

    if (showTooltip) {
      return Tooltip(waitDuration: Duration(milliseconds: 500), message: value, child: widget);
    } else {
      return widget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: SizedBox(width: width, child: _buildCellContent(context)),
    );
  }
}
