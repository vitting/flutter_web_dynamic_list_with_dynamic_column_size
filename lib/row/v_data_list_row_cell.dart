import 'package:flutter/material.dart';
import 'package:v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list_enums.dart';

class VDataListRowCell extends StatelessWidget {
  final String id;
  final String value;
  final bool showTooltip;
  final double? width;
  final Widget? icon;
  final double iconSpacing;
  final double columnSpacing;
  final void Function(String value)? onLongPressCell;
  final RowCellIconPlacement iconPlacement;
  final BorderRadiusGeometry? tooltipBorderRadius;

  const VDataListRowCell({
    super.key,
    required this.id,
    required this.value,
    this.width,
    this.showTooltip = false,
    this.onLongPressCell,
    this.icon,
    this.iconSpacing = 4,
    this.columnSpacing = 0,
    this.iconPlacement = RowCellIconPlacement.right,
    this.tooltipBorderRadius,
  });

  Widget _buildCellContent(BuildContext context) {
    final theme = VDataListTheme.of(context).rowTheme;
    Widget widget = Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textStyle);

    if (onLongPressCell != null) {
      widget = GestureDetector(
        onLongPress: () {
          onLongPressCell?.call(value);
        },
        child: widget,
      );
    }

    if (showTooltip) {
      widget = Tooltip(
        waitDuration: Duration(milliseconds: 500),
        message: value,
        textStyle: theme.tooltipTextStyle,
        decoration: BoxDecoration(color: theme.tooltipBackgroundColor, borderRadius: tooltipBorderRadius),
        child: widget,
      );
    }

    return Row(
      children: [
        if (icon != null && iconPlacement == RowCellIconPlacement.left) ...[
          icon!,
          if (iconSpacing > 0) SizedBox(width: columnSpacing),
        ],
        Expanded(child: widget),
        if (icon != null && iconPlacement == RowCellIconPlacement.right) ...[
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
