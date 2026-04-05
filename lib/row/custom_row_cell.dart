import 'package:flutter/material.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomRowCell extends StatelessWidget {
  final String id;
  final String value;
  final bool showTooltip;
  final double? width;
  final Widget? icon;
  final double iconSpacing;
  final double columnSpacing;
  final void Function(String value)? onLongPressCell;
  final CustomRowCellIconPlacement iconPlacement;

  const CustomRowCell({
    super.key,
    required this.id,
    required this.value,
    this.width,
    this.showTooltip = false,
    this.onLongPressCell,
    this.icon,
    this.iconSpacing = 4,
    this.columnSpacing = 0,
    this.iconPlacement = CustomRowCellIconPlacement.right,
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
      widget = Tooltip(waitDuration: Duration(milliseconds: 500), message: value, child: widget);
    }

    return Row(
      children: [
        if (icon != null && iconPlacement == CustomRowCellIconPlacement.left) ...[
          icon!,
          if (iconSpacing > 0) SizedBox(width: columnSpacing),
        ],
        Expanded(child: widget),
        if (icon != null && iconPlacement == CustomRowCellIconPlacement.right) ...[
          if (iconSpacing > 0) SizedBox(width: columnSpacing),
          icon!,
        ],
        if (columnSpacing > 0) SizedBox(width: columnSpacing),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: SizedBox(width: width, child: _buildCellContent(context)),
    );
  }
}
