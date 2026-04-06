import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class MiscExample extends StatefulWidget {
  static const routeName = '/misc-example';
  const MiscExample({super.key});

  @override
  State<MiscExample> createState() => _MiscExampleState();
}

class _MiscExampleState extends State<MiscExample> {
  bool _totalCountPinned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Misc example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Footer not pinned', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig(),
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
                footer: Container(
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('This is a footer that is outside of the list')),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Footer pinned', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig().copyWith(footerPinned: true),
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
                footer: Container(
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('This is a footer that is outside of the list')),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Total count top', style: TextStyle(fontSize: 20)),
                SizedBox(width: 20),
                Text('Pinned'),
                Switch(
                  value: _totalCountPinned,
                  onChanged: (value) {
                    setState(() {
                      _totalCountPinned = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig().copyWith(showTotalCount: true, showTotalCountPinned: _totalCountPinned),
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Total count bottom', style: TextStyle(fontSize: 20)),
                SizedBox(width: 20),
                Text('Pinned'),
                Switch(
                  value: _totalCountPinned,
                  onChanged: (value) {
                    setState(() {
                      _totalCountPinned = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig().copyWith(
                  showTotalCount: true,
                  totalItemsPosition: TotalCountPosition.bottom,
                  showTotalCountPinned: _totalCountPinned,
                ),
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
              ),
            ),
            SizedBox(height: 20),
            Text('Copy to clipboard', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig().copyWith(longPressToCopyCellValueToClipboard: true),
                onLongPressRowCopyValue: (id, value, data, updatedColumnDefs) =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Copied value: $value')))),
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
              ),
            ),
            SizedBox(height: 20),
            Text('Tap Row', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig(),
                onRowTap: (rowData, column) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                },
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
              ),
            ),
            SizedBox(height: 20),
            Text('Tap Row with handler', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig().copyWith(showRowClickHandler: true),
                onRowTap: (rowData, column) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                },
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
              ),
            ),
            SizedBox(height: 20),
            Text('Tap Row with handler and tap row', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 300,
              child: VDataList(
                columnDefs: columnDefs,
                totalItems: 20,
                config: VDataListConfig().copyWith(showRowClickHandler: true, triggerOnRowTapWhenRowClickHandlerIsShown: true),
                onRowTap: (rowData, column) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                },
                data: GenerateFakeDataHelper.generateData(20, columnDefs.keys.toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
