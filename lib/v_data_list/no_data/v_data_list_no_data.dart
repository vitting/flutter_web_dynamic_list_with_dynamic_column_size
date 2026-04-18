import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListNoData extends StatelessWidget {
  final VDataListConfig config;
  final Widget? child;
  const VDataListNoData({super.key, required this.config, this.child});

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).noDataTheme;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.noDataBorderRadius),
        child: child ?? Center(child: Text(config.noDataMessage!, style: theme.textStyle)),
      ),
    );
  }
}
