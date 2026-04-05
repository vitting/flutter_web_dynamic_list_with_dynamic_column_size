import 'package:web_dynamic_list/v_data_list_type_definitions.dart';

/// A helper class to generate a DataRowList from a ColumnDefinitionMap and an iterable of iterable of strings representing the data
class DataRowHelper {
  /// Helper method to generate a DataRowList from a ColumnDefinitionMap and an iterable of iterable of strings representing the data
  static DataRowList generateDataRowList(ColumnDefinitionMap columnDefs, Iterable<Iterable<String>> data) {
    final List<DataRow> dataRowList = [];
    for (var row in data) {
      final Map<String, String> dataRow = {};
      int index = 0;
      for (var cell in row) {
        if (index < columnDefs.length) {
          final columnId = columnDefs.keys.elementAt(index);
          dataRow[columnId] = cell;
        }
        index++;
      }
      dataRowList.add(dataRow);
    }
    return dataRowList;
  }
}
