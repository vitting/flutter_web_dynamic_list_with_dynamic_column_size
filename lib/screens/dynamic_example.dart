import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:v_data_list/screens/custom_snackbar.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/helpers/data_row_helper.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_style.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class DynamicExample extends StatefulWidget {
  static const String routeName = '/dynamic-example';
  const DynamicExample({super.key});

  @override
  State<DynamicExample> createState() => _DynamicExampleState();
}

class _DynamicExampleState extends State<DynamicExample> {
  final int _totalItems = 20;

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
      appBar: AppBar(title: Text('Dynamic example')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: VDataList(
                      columnDefs: columnDefWithAllColumnsResizable,
                      data: [],
                      totalItems: _totalItems,
                      config: VDataListConfig(),
                      onRowTap: (rowData, column) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                        debugPrint(column.toString());
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 50,
                      child: const Center(child: Text('Some other content')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 50,
                      child: const Center(child: Text('Some other content')),
                    ),
                  ),

                  Expanded(
                    child: VDataList(
                      columnDefs: columnDefWithAllColumnsResizable,
                      data: GenerateFakeDataHelper.generateData(_totalItems, columnDefWithAllColumnsResizable.keys.toList()),
                      totalItems: _totalItems,
                      config: VDataListConfig(),
                      onRowTap: (rowData, column) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                        debugPrint(column.toString());
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 50,
                      child: const Center(child: Text('Some other content')),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: VDataList(
                columnDefs: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig(),
                totalItems: _totalItems,
                onRowTap: (rowData, column) {
                  final rowDataMap = DataRowHelper.getRowDataAsMap(rowData);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowDataMap'))));
                  debugPrint(column.toString());
                },
                onLongPressRowCopyValue: (id, value, data, updatedColumnDefs) {
                  CustomSnackbar.copySnackbar(context, value);
                },
                rowCellStyleBuilder: (context, id, cellData, columnDef) {
                  if (cellData.additionalData != null && cellData.additionalData!.containsKey('animal')) {
                    return _getStyleForAnimal(cellData.additionalData!['animal']);
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
