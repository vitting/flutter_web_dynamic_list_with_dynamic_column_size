import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/helpers/data_row_helper.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class ScreenDynamicHeightScreen extends StatefulWidget {
  static const String routeName = '/dynamic-height';
  const ScreenDynamicHeightScreen({super.key});

  @override
  State<ScreenDynamicHeightScreen> createState() => _ScreenDynamicHeightScreenState();
}

class _ScreenDynamicHeightScreenState extends State<ScreenDynamicHeightScreen> {
  final int _itemsPerPage = 50;
  late VDataListDataRowList _data;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _data = GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefsWithColumnsThatArentResizable.keys.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                footer: Container(
                  color: Colors.purple,
                  height: 50,
                  child: const Center(child: Text('This is a footer that is outside of the list')),
                ),
                config: VDataListConfig().copyWith(
                  showSortIconsInHeader: false,
                  footerPinned: true,
                  showRowClickHandler: true,
                  showTotalCount: true,
                  showTotalCountPinned: true,
                  totalItemsPosition: TotalCountPosition.top,
                ),
                totalItems: 200,
                onLoadMore: () {
                  // Simulate loading more data
                  setState(() {
                    _isLoading = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      _data = DataRowHelper.loadMoreData(
                        _data,
                        GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefsWithColumnsThatArentResizable.keys.toList()),
                      );
                      _isLoading = false;
                    });
                  });
                },
                isLoading: _isLoading,
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
