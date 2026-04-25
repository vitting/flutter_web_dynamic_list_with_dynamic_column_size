import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListTotalCount extends StatelessWidget {
  /// If [container] is provided, it will be used as the container for the total count widget. If not provided, a default container will be used.
  /// The default container will have padding and border radius based on the [config] and background color based on the [theme].
  final Widget? container;
  final VDataListConfig config;
  final Widget? child;
  final TotalCountTheme? theme;
  const VDataListTotalCount({super.key, required this.config, this.child, this.theme, this.container});

  Widget _buildTotalCount(BuildContext context) {
    final theme = VDataListTheme.of(context).totalCountTheme;
    final backgroundColor = VDataListTheme.of(context).backgroundColor;

    Widget totalCountWidget =
        container ??
        Container(
          padding: config.totalCountPadding,
          decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.totalCountBorderRadius),
          child: child,
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
        sliver: SliverToBoxAdapter(child: totalCountWidget),
      );
    }

    return totalCountWidget;
  }

  @override
  Widget build(BuildContext context) {
    return _buildTotalCount(context);
  }
}
