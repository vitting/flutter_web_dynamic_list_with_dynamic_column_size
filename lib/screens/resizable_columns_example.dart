import 'package:flutter/material.dart';
import 'package:v_data_list/generate_fake_data_helper.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';
import 'package:v_data_list/v_data_list/v_data_list.dart';

class ResizableColumnsExample extends StatefulWidget {
  static const routeName = '/resizable-columns-example';
  const ResizableColumnsExample({super.key});

  @override
  State<ResizableColumnsExample> createState() => _ResizableColumnsExampleState();
}

class _ResizableColumnsExampleState extends State<ResizableColumnsExample> {
  late ColumnDefinitionMap _columnDefs;

  @override
  void initState() {
    super.initState();
    _columnDefs = columnDefs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resizable columns example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _columnDefs = columnDefs;
                    });
                  },
                  child: Text('All columns resizable'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _columnDefs = columnDefsSomeResizable;
                    });
                  },
                  child: Text('Some columns resizable'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _columnDefs = columnDefsWithColumnsThatArentResizable;
                    });
                  },
                  child: Text('None columns resizable'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _columnDefs = columnDefsWithWidthResizable;
                    });
                  },
                  child: Text('All with predefined width that are resizable'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _columnDefs = columnDefsWithWidthNotResizable;
                    });
                  },
                  child: Text('All with predefined width that aren\'t resizable'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _columnDefs = columnDefsSomeWithWidth;
                    });
                  },
                  child: Text('Some with predefined width that are resizable'),
                ),
              ],
            ),
            Expanded(
              child: VDataList(
                columnDefs: _columnDefs,
                totalItems: 50,
                data: GenerateFakeDataHelper.generateData(50, _columnDefs.keys.toList()),
                config: VDataListConfig(),
                onRowTap: (rowData, column) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('You Clicked: $rowData'))));
                  debugPrint(column.toString());
                },
                onLongPressRowCopyValue: (id, value, data, updatedColumnDefs) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Copied value: $value'))));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
