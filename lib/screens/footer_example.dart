import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/footer/v_data_list_footer.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class FooterExample extends StatefulWidget {
  static const String routeName = '/footer-example';
  const FooterExample({super.key});

  @override
  State<FooterExample> createState() => _FooterExampleState();
}

class _FooterExampleState extends State<FooterExample> {
  final int _totalItems = 20;
  bool _pinned = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Footer example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Pinned footer'),
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
            Text('Footer config', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                footer: Container(
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('This is a footer that is outside of the list')),
                ),
                config: VDataListConfig().copyWith(
                  footerPadding: EdgeInsets.all(16),
                  footerMargin: EdgeInsets.only(top: 8),
                  footerBorderRadius: BorderRadius.circular(8),
                  footerPinned: _pinned,
                ),
                totalItems: _totalItems,
              ),
            ),
            SizedBox(height: 20),
            Text('Footer builder', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig().copyWith(footerPinned: _pinned),
                totalItems: _totalItems,
                footerBuilder: (context, config, footer, theme) {
                  return VDataListFooter(
                    config: config,
                    container: Container(
                      height: 50,
                      color: Colors.purple,
                      child: const Center(child: Text('This is a custom footer built using the footerBuilder')),
                    ),
                  );
                },
              ),
            ),

            Text('Footer builder', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig().copyWith(footerPinned: _pinned),
                totalItems: _totalItems,
                footer: const Center(child: Text('This is a footer that is outside of the list')),
                footerBuilder: (context, config, footer, theme) {
                  return VDataListFooter(
                    config: config,
                    container: Container(height: 70, color: Colors.yellow, child: footer),
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
