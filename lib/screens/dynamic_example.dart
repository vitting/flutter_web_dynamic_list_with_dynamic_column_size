import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class DynamicExample extends StatefulWidget {
  static const String routeName = '/dynamic-example';
  const DynamicExample({super.key});

  @override
  State<DynamicExample> createState() => _DynamicExampleState();
}

class _DynamicExampleState extends State<DynamicExample> {
  final int _totalItems = 20;

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
                      columnDefinitions: columnDefWithAllColumnsResizable,
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
                    child: VDataList(
                      columnDefinitions: columnDefWithAllColumnsResizable,
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
                      columnDefinitions: columnDefWithAllColumnsResizable,
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
          ],
        ),
      ),
    );
  }
}
