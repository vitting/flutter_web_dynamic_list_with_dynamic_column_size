import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/pagination/v_data_list_pagination_item.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class VDataListPagination extends StatelessWidget {
  final VDataListConfig config;
  final int currentSelectedIndex;
  final VDataListOnPaginationIndexChanged? onPaginationIndexChanged;
  final int pageSize;
  final int totalItems;

  const VDataListPagination({
    super.key,
    required this.currentSelectedIndex,
    required this.pageSize,
    required this.totalItems,
    required this.onPaginationIndexChanged,
    required this.config,
  });

  int get _numberOfPages => (totalItems / pageSize).ceil();

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).paginationTheme;

    return Container(
      padding: config.paginationPadding,
      margin: config.paginationMargin,
      decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.paginationBorderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_numberOfPages, (index) {
          return VDataListPaginationItem(
            index: index,
            currentSelectedIndex: currentSelectedIndex,
            onTap: (pageIndex) => onPaginationIndexChanged?.call(pageIndex, totalItems, pageSize),
          );
        }).toList(),
      ),
    );
  }
}
