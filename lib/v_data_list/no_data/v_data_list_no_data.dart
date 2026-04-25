import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListNoData extends StatelessWidget {
  final Widget? child;
  final VDataListConfig config;
  final NoDataTheme? noDataTheme;

  const VDataListNoData({super.key, required this.config, this.child, this.noDataTheme});

  @override
  Widget build(BuildContext context) {
    final theme = noDataTheme ?? VDataListTheme.of(context).noDataTheme;
    return SliverFillRemaining(
      hasScrollBody: false,
      child:
          child ??
          Container(
            decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.noDataBorderRadius),
            child: Center(child: Text(config.noDataMessage ?? '', style: theme.textStyle)),
          ),
    );
  }
}
