import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_data.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_style.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';

class VDataListRowCell extends StatelessWidget {
  final String id;
  final VDataListRowCellData data;
  final double? width;
  final Widget? icon;
  final double iconSpacing;
  final double columnSpacing;
  final void Function(String value)? onLongPressCell;
  final RowCellIconPlacement iconPlacement;
  final VDataListConfig config;
  final VDataListRowCellStyle? cellStyle;

  const VDataListRowCell({
    super.key,
    required this.id,
    required this.data,
    required this.config,
    this.width,
    this.onLongPressCell,
    this.icon,
    this.iconSpacing = 4,
    this.columnSpacing = 0,
    this.iconPlacement = RowCellIconPlacement.right,
    this.cellStyle,
  });

  bool get _hasIcon => icon != null || (cellStyle != null && cellStyle!.icon != null);

  bool get _isIconOnLeft => cellStyle != null && cellStyle!.iconPlacement != null
      ? cellStyle!.iconPlacement == RowCellIconPlacement.left
      : iconPlacement == RowCellIconPlacement.left;

  bool get _isIconOnRight => cellStyle != null && cellStyle!.iconPlacement != null
      ? cellStyle!.iconPlacement == RowCellIconPlacement.right
      : iconPlacement == RowCellIconPlacement.right;

  Widget _buildCellContent(BuildContext context) {
    final theme = VDataListTheme.of(context).rowTheme;
    Widget widget = Text(
      data.value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textStyle.copyWith(
        color: cellStyle?.textColor ?? theme.textStyle.color,
        fontWeight: cellStyle?.fontWeight ?? theme.textStyle.fontWeight,
        fontStyle: cellStyle?.fontStyle ?? theme.textStyle.fontStyle,
      ),
    );

    if (onLongPressCell != null) {
      widget = GestureDetector(
        onLongPress: () {
          onLongPressCell?.call(data.value);
        },
        child: widget,
      );
    }

    if (config.showTooltip) {
      widget = Tooltip(
        waitDuration: Duration(milliseconds: 500),
        message: data.value,
        textStyle: theme.tooltipTextStyle,
        decoration: BoxDecoration(color: theme.tooltipBackgroundColor, borderRadius: config.tooltipBorderRadius),
        child: widget,
      );
    }

    widget = Row(
      children: [
        if (_hasIcon && _isIconOnLeft) ...[cellStyle!.icon ?? icon!, if (iconSpacing > 0) SizedBox(width: columnSpacing)],
        Expanded(child: widget),
        if (_hasIcon && _isIconOnRight) ...[if (iconSpacing > 0) SizedBox(width: columnSpacing), cellStyle!.icon ?? icon!],
        if (columnSpacing > 0) SizedBox(width: columnSpacing),
      ],
    );

    if (cellStyle != null && cellStyle!.backgroundColor != null) {
      widget = Container(color: cellStyle!.backgroundColor, child: widget);
    }

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: SizedBox(width: width, child: _buildCellContent(context)),
    );
  }
}
