import 'package:flutter/material.dart';
import 'package:v_data_list/theme/v_data_list_theme.dart';

class VDataListTotalCount extends StatelessWidget {
  final int? total;
  final TextAlign textAlign;
  final double horizontalPadding;
  final double verticalPadding;
  final BorderRadiusGeometry? borderRadius;
  final String prefixText;
  final double totalCountBottomSpacing;
  const VDataListTotalCount({
    super.key,
    required this.total,
    this.textAlign = TextAlign.start,
    this.borderRadius,
    this.prefixText = 'Total Items: ',
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
    this.totalCountBottomSpacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).totalCountTheme;
    return SliverPadding(
      padding: EdgeInsets.only(bottom: totalCountBottomSpacing),
      sliver: SliverToBoxAdapter(
        child: total != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: borderRadius),
                child: Text('$prefixText $total', textAlign: textAlign, style: theme.textStyle),
              )
            : null,
      ),
    );
  }
}
