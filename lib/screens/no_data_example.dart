import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/no_data/v_data_list_no_data.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class NoDataExample extends StatelessWidget {
  static const String routeName = '/no-data-example';
  const NoDataExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset width dialog example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('no data config', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: [],
                config: VDataListConfig().copyWith(noDataMessage: 'No data found', noDataBorderRadius: BorderRadius.circular(8)),
                totalItems: 0,
              ),
            ),
            SizedBox(height: 20),
            Text('no data builder', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: [],
                config: VDataListConfig(),
                totalItems: 0,
                noDataBuilder: (context, config, theme) {
                  return VDataListNoData(
                    config: config,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'This is a custom no data widget. You can provide your own widget to show when there is no data.',
                        textAlign: TextAlign.center,
                      ),
                    ),
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
