import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/helpers/data_row_helper.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class LazyLoadExample extends StatefulWidget {
  static const routeName = '/lazy-load-example';

  const LazyLoadExample({super.key});

  @override
  State<LazyLoadExample> createState() => _LazyLoadExampleState();
}

class _LazyLoadExampleState extends State<LazyLoadExample> {
  final int _itemsPerPage = 50;
  final int _totalItems = 200;

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
      appBar: AppBar(title: Text('Lazy load example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: VDataList(
                columnDefs: columnDefsWithColumnsThatArentResizable,
                data: _data,
                config: VDataListConfig(),
                totalItems: _totalItems,
                isLoading: _isLoading,
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
