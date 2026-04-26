import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/helpers/data_row_helper.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_style.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class RowCellStyleBuilderExample extends StatelessWidget {
  static const routeName = '/row-cell-style-builder-example';
  const RowCellStyleBuilderExample({super.key});

  VDataListRowCellStyle? _getStyleForAnimal(String animal) {
    switch (animal) {
      case 'Dog':
        return VDataListRowCellStyle(textColor: Colors.brown[200], icon: Icon(Symbols.sound_detection_dog_barking));
      case 'Cat':
        return VDataListRowCellStyle(icon: Icon(Symbols.pets), fontWeight: FontWeight.w700);
      case 'Fish':
        return VDataListRowCellStyle(textColor: Colors.blue[200]);
      case 'Horse':
        return VDataListRowCellStyle(
          backgroundColor: Colors.brown[400],
          icon: Icon(Symbols.chess_knight),
          iconPlacement: RowCellIconPlacement.right,
        );
      case 'Owl':
        return VDataListRowCellStyle(backgroundColor: Colors.grey[500], icon: Icon(Symbols.owl));
      case 'Mouse':
        return VDataListRowCellStyle(textColor: Colors.grey[200], icon: Icon(Symbols.pest_control_rodent));
      case 'Chicken':
        return VDataListRowCellStyle(textColor: Colors.yellow[200], icon: Icon(Symbols.egg));
      case 'Bug':
        return VDataListRowCellStyle(textColor: Colors.green[200], icon: Icon(Symbols.bug_report));
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row cell style builder example 1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Row cell style builder example', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(100, columnDefs.keys.toList()),
                config: VDataListConfig(),
                totalItems: 100,
                onRowTap: (rowData, column) {
                  final rowDataMap = DataRowHelper.getRowDataAsMap(rowData);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowDataMap'))));
                  debugPrint(column.toString());
                },
                rowCellStyleBuilder: (context, id, cellData, columnDef) {
                  if (cellData.additionalData != null && cellData.additionalData!.containsKey('animal')) {
                    return _getStyleForAnimal(cellData.additionalData!['animal']);
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Row cell style builder example 2', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefsWithTypes,
                data: GenerateFakeDataHelper.generateData(100, columnDefsWithTypes.keys.toList()),
                config: VDataListConfig(),
                totalItems: 100,
                onRowTap: (rowData, column) {
                  final rowDataMap = DataRowHelper.getRowDataAsMap(rowData);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowDataMap'))));
                  debugPrint(column.toString());
                },

                rowCellStyleBuilder: (context, id, cellData, columnDef) {
                  if (columnDef.type == 'email') {
                    return VDataListRowCellStyle(
                      icon: Padding(padding: const EdgeInsets.only(right: 8.0), child: Icon(Symbols.email)),
                      textColor: Colors.red[200],
                    );
                  }

                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
