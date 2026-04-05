import 'package:web_dynamic_list/config/column_definition.dart';
import 'package:web_dynamic_list/v_data_list_type_definitions.dart';

/// A helper class to generate a ColumnDefinitionMap from a list of ColumnDefinition objects
class ColumnDefinitionHelper {
  /// Helper method to generate a ColumnDefinitionMap from a list of ColumnDefinition objects
  /// Where the key of the map is the column ID and the value is the ColumnDefinition itself
  static ColumnDefinitionMap generateColumnDefinitionMap(List<ColumnDefinition> columnDefinitions) {
    final Map<String, ColumnDefinition> columnDefMap = {};
    for (var colDef in columnDefinitions) {
      columnDefMap.addEntries([_generateColumnDefinition(colDef)]);
    }
    return columnDefMap;
  }

  static ColumnDefinitionMapEntry _generateColumnDefinition(ColumnDefinition columnDefinition) {
    return MapEntry(columnDefinition.id, columnDefinition);
  }
}
