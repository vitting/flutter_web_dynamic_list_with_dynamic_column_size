import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class LoadMoreDataSpinnerBuilder extends StatelessWidget {
  static const routeName = '/load-more-data-spinner-builder';
  const LoadMoreDataSpinnerBuilder({super.key});
  final int _totalItems = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset width dialog example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Default loading spinner', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig(),
                totalItems: _totalItems,
                isLoading: true,
              ),
            ),
            SizedBox(height: 20),
            Text('Custom loading spinner', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig(),
                isLoading: true,
                loadMoreDataSpinnerBuilder: (context, config) {
                  return Container(height: 60, alignment: Alignment.center, child: const LinearProgressIndicator());
                },
                totalItems: _totalItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
