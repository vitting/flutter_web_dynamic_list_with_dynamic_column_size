import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/total_count/v_data_list_total_count.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class TotalCountExample extends StatelessWidget {
  static const routeName = '/total-count-example';
  const TotalCountExample({super.key});
  final int _totalItems = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset width dialog example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('resetWidthDialog config', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig().copyWith(showTotalCountPinned: true, totalItemsPosition: TotalCountPosition.bottom),
                totalItems: _totalItems,
                totalCountBuilder: (context, config, total, theme) {
                  return VDataListTotalCount(
                    config: config,
                    container: Material(
                      child: Text(' Total items: $total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('resetWidthDialogBuilder', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig(),
                totalItems: _totalItems,
                resetWidthDialogBuilder: (context, config) {
                  return AlertDialog(
                    title: Text('This is a custom dialog'),
                    content: Text(
                      'You can provide your own dialog builder to show a custom dialog when resetting column widths.',
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('Cancel')),
                      TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text('Confirm')),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
