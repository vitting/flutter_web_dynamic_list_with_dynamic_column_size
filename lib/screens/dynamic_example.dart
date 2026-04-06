import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class DynamicExample extends StatefulWidget {
  static const String routeName = '/dynamic-example';
  const DynamicExample({super.key});

  @override
  State<DynamicExample> createState() => _DynamicExampleState();
}

class _DynamicExampleState extends State<DynamicExample> {
  final int _itemsPerPage = 20;
  late VDataListDataRowList _data;

  @override
  void initState() {
    super.initState();
    _data = GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefsWithColumnsThatArentResizable.keys.toList());
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
                      data: GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefWithAllColumnsResizable.keys.toList()),
                      totalItems: _itemsPerPage,
                      config: VDataListConfig(),
                      // onLoadMore: _loadMoreData,
                      // isLoading: false,
                      // totalItems: _totalItems,
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
                      child: const Center(child: Text('This is a header that is outside of the list')),
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
                      child: const Center(child: Text('This is a header that is outside of the list')),
                    ),
                  ),

                  Expanded(
                    child: VDataList(
                      columnDefs: columnDefWithAllColumnsResizable,
                      data: GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefWithAllColumnsResizable.keys.toList()),
                      totalItems: _itemsPerPage,
                      config: VDataListConfig(),

                      // onLoadMore: _loadMoreData,
                      // isLoading: false,
                      // totalItems: _totalItems,
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
                      child: const Center(child: Text('This is a header that is outside of the list')),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 50,
                        child: const Center(child: Text('This is a header that is outside of the list')),
                      ),
                      Container(
                        color: Colors.amber,
                        height: 50,
                        child: const Center(child: Text('This is a header that is outside of the list')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.green,
                        height: 50,
                        child: const Center(child: Text('This is a header that is outside of the list')),
                      ),
                      Container(
                        color: Colors.green,
                        height: 50,
                        child: const Center(child: Text('This is a header that is outside of the list')),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red,
                        height: 50,
                        child: const Center(child: Text('This is a header that is outside of the list')),
                      ),
                      Container(
                        color: Colors.red,
                        height: 50,
                        child: const Center(child: Text('This is a header that is outside of the list')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: VDataList(
                columnDefs: columnDefs,
                data: _data,
                config: VDataListConfig(),
                totalItems: 20,
                onRowTap: (rowData, column) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                  debugPrint(column.toString());
                },
                onLongPressRowCopyValue: (id, value, data, updatedColumnDefs) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Copied value: $value'))));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
