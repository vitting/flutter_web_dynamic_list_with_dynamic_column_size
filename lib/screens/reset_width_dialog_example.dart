import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class ResetWidthDialogExample extends StatelessWidget {
  static const String routeName = '/reset-width-dialog-example';
  const ResetWidthDialogExample({super.key});
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
                config: VDataListConfig().copyWith(
                  resetWidthDialogTitle: 'Reset column widths?',
                  resetWidthDialogContent: 'Are you sure you want to reset the column widths to their default values?',
                  resetWidthDialogConfirmButtonText: 'Yes, reset',
                  resetWidthDialogCancelButtonText: 'No, keep',
                ),
                totalItems: _totalItems,
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
