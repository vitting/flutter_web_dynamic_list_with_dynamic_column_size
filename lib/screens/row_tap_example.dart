import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class RowTapExample extends StatelessWidget {
  static const routeName = '/row-tap-example';
  const RowTapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row tap example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tap Row', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
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
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
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
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
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
