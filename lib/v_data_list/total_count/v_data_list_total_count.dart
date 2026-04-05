import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListTotalCount extends StatelessWidget {
  final int? total;
  final TextAlign textAlign;
  final double horizontalPadding;
  final double verticalPadding;
  final BorderRadiusGeometry? borderRadius;
  final String prefixText;
  final double totalCountBottomSpacing;
  final bool showAsPinned;
  final Widget? child;
  const VDataListTotalCount({
    super.key,
    required this.total,
    this.textAlign = TextAlign.start,
    this.borderRadius,
    this.prefixText = 'Total Items: ',
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
    this.totalCountBottomSpacing = 4,
    this.showAsPinned = false,
    this.child,
  });

  Widget _buildTotalCount(BuildContext context) {
    final theme = VDataListTheme.of(context).totalCountTheme;
    final backgroundColor = VDataListTheme.of(context).backgroundColor;

    Widget totalCountWidget = Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: borderRadius),
      child: child ?? Text('$prefixText $total', textAlign: textAlign, style: theme.textStyle),
    );

    if (showAsPinned) {
      totalCountWidget = PinnedHeaderSliver(
        child: Column(
          children: [
            Row(children: [Expanded(child: totalCountWidget)]),
            Container(height: totalCountBottomSpacing, color: backgroundColor),
          ],
        ),
      );
    } else {
      totalCountWidget = SliverPadding(
        padding: EdgeInsets.only(bottom: totalCountBottomSpacing),
        sliver: SliverToBoxAdapter(child: total != null ? totalCountWidget : null),
      );
    }

    return totalCountWidget;
  }

  @override
  Widget build(BuildContext context) {
    return _buildTotalCount(context);
  }
}
