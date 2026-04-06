import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListResizableHandler extends StatelessWidget {
  final VDataListConfig config;
  const VDataListResizableHandler({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).resizeHandlerTheme;
    return Container(
      margin: config.resizeHandlerMargin,
      padding: config.resizeHandlerPadding,
      decoration: BoxDecoration(shape: BoxShape.circle, color: theme.backgroundColor),
      child: config.resizeHandlerIcon,
    );
  }
}
