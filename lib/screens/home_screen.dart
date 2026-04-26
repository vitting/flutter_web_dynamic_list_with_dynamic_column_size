import 'package:flutter/material.dart';
import 'package:v_data_list/screens/footer_example.dart';
import 'package:v_data_list/screens/header_builder_example.dart';
import 'package:v_data_list/screens/load_more_data_spinner_builder_example.dart';
import 'package:v_data_list/screens/no_data_example.dart';
import 'package:v_data_list/screens/reset_width_dialog_example.dart';
import 'package:v_data_list/screens/row_builder_example.dart';
import 'package:v_data_list/screens/row_cell_style_builder_example.dart';
import 'package:v_data_list/screens/sort_example.dart';
import 'package:v_data_list/screens/total_count_example.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dynamic-example');
                },
                child: Text('Dynamic example'),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/misc-example');
                },
                child: Text('Misc example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lazy-load-example');
                },
                child: Text('Lazy load example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pagination-example');
                },
                child: Text('Pagination example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/resizable-columns-example');
                },
                child: Text('Resizable columns example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ResetWidthDialogExample.routeName);
                },
                child: Text('Custom reset width dialog example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, NoDataExample.routeName);
                },
                child: Text('No data example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FooterExample.routeName);
                },
                child: Text('Footer example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TotalCountExample.routeName);
                },
                child: Text('Total Count example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoadMoreDataSpinnerBuilder.routeName);
                },
                child: Text('Load more data spinner builder example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RowCellStyleBuilderExample.routeName);
                },
                child: Text('RowCellStyleBuilder example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RowBuilderExample.routeName);
                },
                child: Text('RowBuilder example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HeaderBuilderExample.routeName);
                },
                child: Text('HeaderBuilder example'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SortExample.routeName);
                },
                child: Text('Sort example'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
