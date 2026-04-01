import 'package:flutter/material.dart' hide DataRow;
import 'package:web_dynamic_list/custom_header.dart';
import 'package:web_dynamic_list/custom_row.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomList extends StatefulWidget {
  final ColumnDefinitionMap columnDefs;
  final DataRowList data;
  final bool showTooltip;
  final bool textIsSelectable;
  const CustomList({
    super.key,
    required this.columnDefs,
    this.data = const [],
    this.showTooltip = false,
    this.textIsSelectable = true,
  });

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  late ColumnDefinitionMap _localColumnDefs;
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  @override
  void initState() {
    super.initState();
    _localColumnDefs = {...widget.columnDefs};
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

  Widget _buildRow(DataRow data, bool isEven, bool textIsSelectable) {
    final rowContent = CustomRow(columnDefs: _localColumnDefs, data: data, isEven: isEven, showTooltip: widget.showTooltip);

    if (textIsSelectable) {
      return SelectionArea(child: rowContent);
    } else {
      return rowContent;
    }
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
                  onSortTap: (id, sortState) {
                    setState(() {
                      _localColumnDefs = _localColumnDefs.map((key, value) {
                        if (key == id) {
                          return MapEntry(key, value.copyWith(sortState: sortState));
                        } else {
                          return MapEntry(key, value.copyWith(sortState: ColumnSortState.none));
                        }
                      });
                    });
                  },
                  onDragUpdate: (delta, id, currentWidth) {
                    _updateColumnWidth(id, delta, currentWidth);
                  },
                ),
              ),
              SliverList.builder(
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  final bool isEven = index % 2 == 0;
                  return _buildRow(widget.data[index], isEven, widget.textIsSelectable);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
