import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/screens/custom_snackbar.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class CopyToClipboardExample extends StatelessWidget {
  static const routeName = '/copy-to-clipboard-example';
  const CopyToClipboardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Copy to clipboard example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                totalItems: 100,
                config: VDataListConfig().copyWith(longPressToCopyCellValueToClipboard: true),
                onLongPressRowCopyValue: (id, value, data, updatedColumnDefs) => CustomSnackbar.copySnackbar(context, value),
                data: GenerateFakeDataHelper.generateData(100, columnDefs.keys.toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
