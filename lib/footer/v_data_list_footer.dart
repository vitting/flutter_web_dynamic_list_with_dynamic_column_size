import 'package:flutter/material.dart';
import 'package:v_data_list/theme/v_data_list_theme.dart';

class VDataListFooter extends StatelessWidget {
  final EdgeInsetsGeometry? footerPadding;
  final BorderRadiusGeometry? footerBorderRadius;
  final EdgeInsetsGeometry? footerMargin;
  final Widget? child;
  const VDataListFooter({super.key, this.footerPadding, this.footerBorderRadius, this.footerMargin, this.child});

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).footerTheme;
    return Container(
      padding: footerPadding,
      margin: footerMargin,
      decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: footerBorderRadius),
      child: child,
    );
  }
}
