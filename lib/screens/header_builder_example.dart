import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/header/v_data_list_header.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class HeaderBuilderExample extends StatelessWidget {
  static const String routeName = '/header-builder-example';
  const HeaderBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HeaderBuilder example')),
      body: Column(
        children: [
          Expanded(
            child: VDataList(
              columnDefinitions: columnDefs,
              totalItems: 100,
              config: VDataListConfig().copyWith(
                showRowEvenBackgroundColor: true,
                showRowHoverColor: false,
                headerBorderRadius: BorderRadius.zero,
                headerBottomSpacing: 0,
                showSortIconsInHeader: true,
              ),
              onRowTap: (rowData, column) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
              },
              data: GenerateFakeDataHelper.generateData(100, columnDefs.keys.toList()),
              onSortChanged: (columnId, sortState, updatedColumnDefinitions) {
                debugPrint('Column sorted: $columnId, sortState: $sortState');
              },
              headerBuilder:
                  (context, columnDefintionMap, config, resizeHandler, onSortChanged, onDragHandlerLongPress, onDragUpdate) {
                    return VDataListHeader(
                      columnDefinitions: columnDefintionMap,
                      config: config,
                      resizeHandler: resizeHandler,
                      onSortTap: onSortChanged,
                      onDragHandlerLongPress: onDragHandlerLongPress,
                      onDragUpdate: onDragUpdate,
                      headerTheme: VDataListTheme.of(context).headerTheme.copyWith(
                        backgroundColor: Colors.red,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    );
                  },
            ),
          ),
        ],
      ),
    );
  }
}
