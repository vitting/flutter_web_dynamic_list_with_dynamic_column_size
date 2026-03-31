import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_header.dart';
import 'package:web_dynamic_list/custom_row.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';

final faker = Faker();
String getValueForColumn(String columnId) {
  switch (columnId) {
    case 'id':
      return faker.guid.guid();
    case 'name':
      return faker.person.name();
    case 'email':
      return faker.internet.email();
    case 'phone':
      return faker.phoneNumber.us();
    case 'street':
      return faker.address.streetAddress();
    case 'city':
      return faker.address.city();
    case 'country':
      return faker.address.country();
    default:
      return '';
  }
}

List<Map<String, String>> generateData(int rowCount, List<String> columnIds) {
  final List<Map<String, String>> rows = [];

  for (int i = 0; i < rowCount; i++) {
    final Map<String, String> rowData = {};
    for (var columnId in columnIds) {
      rowData[columnId] = getValueForColumn(columnId);
    }
    rows.add(Map.from(rowData));
  }
  return rows;
}

class CustomList extends StatefulWidget {
  final ColumnDefinitionMap columnDefs;
  const CustomList({super.key, required this.columnDefs});

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  late ColumnDefinitionMap _localColumnDefs;
  late List<Map<String, String>> _data;
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  @override
  void initState() {
    super.initState();
    _localColumnDefs = {...widget.columnDefs};
    _data = generateData(150, widget.columnDefs.keys.toList());
  }

  void _updateColumnWidth(String id, double delta, currentColumnWidth) {
    setState(() {
      final newWidth = (currentColumnWidth ?? 100) + delta;
      _localColumnDefs = {..._localColumnDefs, id: _localColumnDefs[id]!.copyWith(width: newWidth.clamp(100, 500))};
    });
  }

  // Calculate the total width needed for all columns
  double get _totalWidth {
    double totalWidth = 0;
    for (var columnDef in _localColumnDefs.values) {
      totalWidth += columnDef.width ?? 100; // Default width if null
    }
    return totalWidth;
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _horizontalController,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: _totalWidth.clamp(MediaQuery.of(context).size.width, double.infinity),
          child: CustomScrollView(
            controller: _verticalController,
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.orange,
                title: CustomHeader(
                  columnDefs: _localColumnDefs,
                  useExpanded: true,
                  onDragUpdate: (delta, id, currentWidth) {
                    _updateColumnWidth(id, delta, currentWidth);
                  },
                ),
              ),
              SliverList.builder(
                itemCount: 150,
                itemBuilder: (context, index) {
                  return CustomRow(columnDefs: _localColumnDefs, data: _data[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
