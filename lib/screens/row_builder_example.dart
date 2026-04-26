import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/header/v_data_list_header.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_style.dart';
import 'package:v_data_list/v_data_list/row/v_data_list_row.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class RowBuilderExample extends StatelessWidget {
  static const String routeName = '/row-builder-example';
  const RowBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RowBuilder example')),
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
              ),
              onRowTap: (rowData, column) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
              },
              data: GenerateFakeDataHelper.generateData(100, columnDefs.keys.toList()),
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
                        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    );
                  },
              rowBuilder: (context, data, columnDefinitions, config, rowCellStyleBuilder, index, isEven) {
                return VDataListRow(
                  rowTheme: isEven
                      ? VDataListTheme.of(context).rowTheme.copyWith(
                          backgroundColor: Colors.purple[500]!,
                          hoverBackgroundColor: Colors.purple[300]!,
                          evenBackgroundColor: Colors.yellow,
                        )
                      : null,
                  columnDefinitions: columnDefinitions,
                  isEven: isEven,
                  rowData: data,
                  config: config,
                  rowCellStyleBuilder: (context, columnId, cellData, columnDefinition) {
                    if (columnId == 'name') {
                      return VDataListRowCellStyle(backgroundColor: Colors.yellow);
                    }
                    return null;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
