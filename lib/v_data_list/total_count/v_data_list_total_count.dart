import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListTotalCount extends StatelessWidget {
  final VDataListConfig config;
  final int? total;
  final TextAlign textAlign;
  final String prefixText;
  final Widget? child;
  const VDataListTotalCount({
    super.key,
    required this.total,
    required this.config,
    this.textAlign = TextAlign.start,
    this.prefixText = 'Total Items: ',
    this.child,
  });

  Widget _buildTotalCount(BuildContext context) {
    final theme = VDataListTheme.of(context).totalCountTheme;
    final backgroundColor = VDataListTheme.of(context).backgroundColor;

    Widget totalCountWidget = Container(
      padding: config.totalCountPadding,
      decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.totalCountBorderRadius),
      child: child ?? Text('$prefixText $total', textAlign: textAlign, style: theme.textStyle),
    );

    if (config.showTotalCountPinned) {
      totalCountWidget = PinnedHeaderSliver(
        child: Column(
          children: [
            Row(children: [Expanded(child: totalCountWidget)]),
            Container(height: config.totalCountBottomSpacing, color: backgroundColor),
          ],
        ),
      );
    } else {
      totalCountWidget = SliverPadding(
        padding: EdgeInsets.only(bottom: config.totalCountBottomSpacing),
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
