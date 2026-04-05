import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

/// A helper class to generate a DataRowList from a ColumnDefinitionMap and an iterable of iterable of strings representing the data
class DataRowHelper {
  /// Helper method to generate a DataRowList from a ColumnDefinitionMap and an iterable of iterable of strings representing the data
  static VDataListDataRowList generateDataRowListFromListOfData(ColumnDefinitionMap columnDefs, Iterable<Iterable<String>> data) {
    final List<VDataListDataRow> dataRowList = [];
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

  static VDataListDataRowList loadMoreDataFromListOfData(
    ColumnDefinitionMap columnDefs,
    VDataListDataRowList existingData,
    Iterable<Iterable<String>> newData,
  ) {
    final newDataRows = generateDataRowListFromListOfData(columnDefs, newData);
    return [...existingData, ...newDataRows];
  }

  static VDataListDataRowList loadMoreData(VDataListDataRowList existingData, VDataListDataRowList newData) {
    return [...existingData, ...newData];
  }
}
