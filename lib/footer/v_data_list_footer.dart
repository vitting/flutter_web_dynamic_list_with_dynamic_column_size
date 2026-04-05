import 'package:flutter/material.dart';

class VDataListFooter extends StatelessWidget {
  final EdgeInsetsGeometry? footerPadding;
  final BorderRadiusGeometry? footerBorderRadius;
  final EdgeInsetsGeometry? footerMargin;
  final Widget? child;
  const VDataListFooter({super.key, this.footerPadding, this.footerBorderRadius, this.footerMargin, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: footerPadding,
      margin: footerMargin,
      decoration: BoxDecoration(color: Colors.blue, borderRadius: footerBorderRadius),
      child: child,
    );
  }
}
