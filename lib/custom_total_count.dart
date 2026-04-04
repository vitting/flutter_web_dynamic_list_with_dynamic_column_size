import 'package:flutter/material.dart';

class CustomTotalCount extends StatelessWidget {
  final int total;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final String prefixText;
  const CustomTotalCount({
    super.key,
    required this.total,
    this.textStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    this.textAlign = TextAlign.start,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 8,
    this.prefixText = 'Total Items: ',
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: Text('$prefixText $total', textAlign: textAlign, style: textStyle),
    );
  }
}
