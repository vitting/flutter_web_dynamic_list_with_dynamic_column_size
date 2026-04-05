import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListResizableHandler extends StatelessWidget {
  final Widget? icon;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const VDataListResizableHandler({super.key, this.icon, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).resizeHandlerTheme;
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(shape: BoxShape.circle, color: theme.backgroundColor),
      child: icon,
    );
  }
}
