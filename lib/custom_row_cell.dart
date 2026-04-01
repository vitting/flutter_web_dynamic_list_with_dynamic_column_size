import 'package:flutter/material.dart';

class CustomRowCell extends StatelessWidget {
  final String id;
  final String value;
  final bool showTooltip;
  final double? width;

  const CustomRowCell({super.key, required this.id, required this.value, this.width, this.showTooltip = false});

  Widget _buildCellContent() {
    final textWidget = Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.black),
    );

    if (showTooltip) {
      return Tooltip(
        waitDuration: Duration(milliseconds: 500),
        triggerMode: TooltipTriggerMode.tap,
        message: value,
        child: textWidget,
      );
    } else {
      return textWidget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: SizedBox(width: width, child: _buildCellContent()),
    );
  }
}
