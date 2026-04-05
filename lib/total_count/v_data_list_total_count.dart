import 'package:flutter/material.dart';

class VDataListTotalCount extends StatelessWidget {
  final int? total;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final BorderRadiusGeometry? borderRadius;
  final String prefixText;
  final double totalCountBottomSpacing;
  const VDataListTotalCount({
    super.key,
    required this.total,
    this.textStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    this.textAlign = TextAlign.start,
    this.backgroundColor = Colors.blue,
    this.borderRadius,
    this.prefixText = 'Total Items: ',
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
    this.totalCountBottomSpacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: totalCountBottomSpacing),
      sliver: SliverToBoxAdapter(
        child: total != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                decoration: BoxDecoration(color: backgroundColor, borderRadius: borderRadius),
                child: Text('$prefixText $total', textAlign: textAlign, style: textStyle),
              )
            : null,
      ),
    );
  }
}
