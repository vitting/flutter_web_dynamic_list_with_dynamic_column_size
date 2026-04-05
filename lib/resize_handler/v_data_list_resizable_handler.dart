import 'package:flutter/material.dart';
import 'package:v_data_list/theme/v_data_list_theme.dart';

class VDataListResizableHandler extends StatelessWidget {
  final Widget? icon;
  const VDataListResizableHandler({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).resizeHandlerTheme;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: theme.backgroundColor),
      child: icon,
    );
  }
}
