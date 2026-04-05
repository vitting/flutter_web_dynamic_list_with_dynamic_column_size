import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_list.dart';
import 'package:web_dynamic_list/config/custom_list_config.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/generate_fake_data_helper.dart';

void main() {
  runApp(const WebListExampleApp());
}

class WebListExampleApp extends StatelessWidget {
  const WebListExampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web List Example',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Web List Example'),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DataRowList _data;
  bool _isLoading = false;
  int _currentPage = 1;
  final int _itemsPerPage = 50;
  final int _totalItems = 1000;

  @override
  void initState() {
    super.initState();
    _data = GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefsWithColumnsThatArentResizable.keys.toList());
  }

  void _loadMoreData() {
    if (_isLoading) return;

    setState(() async {
      _isLoading = true;
    });

    // Simulate network delay

    final newData = GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefsWithColumnsThatArentResizable.keys.toList());
    _data.addAll(newData);
    _currentPage++;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomList(
                      columnDefs: columnDefWithAllColumnsResizable,
                      data: GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefWithAllColumnsResizable.keys.toList()),
                      config: CustomListConfig(),
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
                    child: CustomList(
                      columnDefs: columnDefWithAllColumnsResizable,
                      data: GenerateFakeDataHelper.generateData(_itemsPerPage, columnDefWithAllColumnsResizable.keys.toList()),
                      config: CustomListConfig(),

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
              child: CustomList(
                columnDefs: columnDefs,
                data: _data,
                config: CustomListConfig().copyWith(showSortIconsInHeader: false),
                // onLoadMore: _loadMoreData,
                // isLoading: false,
                // totalItems: _totalItems,
                onRowTap: (rowData, column) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                  debugPrint(column.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
