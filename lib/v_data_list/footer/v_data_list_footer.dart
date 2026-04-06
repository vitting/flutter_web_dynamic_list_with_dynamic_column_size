import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListFooter extends StatelessWidget {
  final Widget? child;
  final VDataListConfig config;
  const VDataListFooter({super.key, required this.config, this.child});

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).footerTheme;
    return Container(
      padding: config.footerPadding,
      margin: config.footerMargin,
      decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.footerBorderRadius),
      child: child,
    );
  }
}
