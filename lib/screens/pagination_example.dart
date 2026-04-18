import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class PaginationExample extends StatefulWidget {
  static const routeName = '/pagination-example';
  const PaginationExample({super.key});

  @override
  State<PaginationExample> createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  final int _itemsPerPage = 50;
  final int _totalItems = 200;
  int _currentPage = 0;
  bool _pinned = false;

  late VDataListDataRowList _data;
  @override
  void initState() {
    super.initState();
    _data = GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefsWithColumnsThatArentResizable.keys.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagination example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Pinned pagination bar'),
                Switch(
                  value: _pinned,
                  onChanged: (value) {
                    setState(() {
                      _pinned = value;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: VDataList(
                columnDefs: columnDefsWithColumnsThatArentResizable,
                data: _data,
                config: VDataListConfig().copyWith(showPagination: true, paginationPinned: _pinned),
                totalItems: _totalItems,
                paginationCurrentPage: _currentPage,
                paginationItemsPerPage: _itemsPerPage,
                onPaginationIndexChanged: (page, totalItems, pageSize) {
                  // Simulate loading data for the selected page
                  setState(() {
                    _currentPage = page;
                    _data = [...GenerateFakeDataHelper.generateData(pageSize, columnDefs.keys.toList())];
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
