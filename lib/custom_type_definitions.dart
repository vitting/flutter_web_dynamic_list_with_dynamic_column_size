import 'package:web_dynamic_list/column_definition.dart';

/// A typedef for the column definition map, which is a map where
/// the key is the column ID and the value is the ColumnDefinition object for that column
typedef ColumnDefinitionMap = Map<String, ColumnDefinition>;

/// A typedef for a single entry in the column definition map,
/// which is a MapEntry where the key is the column ID and the value
/// is the ColumnDefinition object for that column
typedef ColumnDefinitionMapEntry = MapEntry<String, ColumnDefinition>;

/// A typedef for the data row, which is a map where the key is the
/// column ID and the value is the cell value for that column in that row
typedef DataRow = Map<String, String>;

/// A typedef for the list of data rows, which is a list of DataRow objects
typedef DataRowList = List<DataRow>;
