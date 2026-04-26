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
  int _itemsPerPage2 = 10;
  final int _totalItems = 200;
  int _currentPage = 0;
  int _currentPage2 = 0;
  bool _pinned = false;

  late VDataListDataRowList _data;
  late VDataListDataRowList _data2;
  @override
  void initState() {
    super.initState();
    _data = GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefsWithColumnsThatArentResizable.keys.toList());
    _data2 = GenerateFakeDataHelper.generateData(_itemsPerPage2, columnDefsWithColumnsThatArentResizable.keys.toList());
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
            SizedBox(height: 20),
            Row(children: [Text('Pagination with default builder')]),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefsWithColumnsThatArentResizable,
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
            SizedBox(height: 20),
            Row(children: [Text('Pagination builder')]),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefsWithColumnsThatArentResizable,
                data: _data2,
                config: VDataListConfig().copyWith(showPagination: true, paginationPinned: _pinned),
                paginationBuilder: (context, config, currentPage, pageSize, totalItems, onPaginationIndexChanged) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.blueGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Page ${currentPage + 1} of ${(totalItems / pageSize).ceil()}'),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: currentPage > 0
                              ? () => onPaginationIndexChanged?.call(currentPage - 1, totalItems, pageSize)
                              : null,
                          child: Text('Previous'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: currentPage < (totalItems / pageSize).ceil() - 1
                              ? () => onPaginationIndexChanged?.call(currentPage + 1, totalItems, pageSize)
                              : null,
                          child: Text('Next'),
                        ),
                        SizedBox(width: 10),
                        DropdownButton(
                          value: pageSize,
                          items: [
                            DropdownMenuItem(value: 10, child: Text('10')),
                            DropdownMenuItem(value: 20, child: Text('20')),
                            DropdownMenuItem(value: 50, child: Text('50')),
                            DropdownMenuItem(value: 100, child: Text('100')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              onPaginationIndexChanged?.call(0, totalItems, value);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
                totalItems: _totalItems,
                paginationCurrentPage: _currentPage2,
                paginationItemsPerPage: _itemsPerPage2,
                onPaginationIndexChanged: (page, totalItems, pageSize) {
                  // Simulate loading data for the selected page
                  setState(() {
                    _itemsPerPage2 = pageSize;
                    _currentPage2 = page;
                    _data2 = [...GenerateFakeDataHelper.generateData(pageSize, columnDefs.keys.toList())];
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
