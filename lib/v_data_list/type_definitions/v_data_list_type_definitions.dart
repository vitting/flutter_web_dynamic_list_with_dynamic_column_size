import 'package:v_data_list/v_data_list/config/column_definition.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_data.dart';

/// A typedef for the column definition map, which is a map where
/// the key is the column ID and the value is the ColumnDefinition object for that column
typedef ColumnDefinitionMap = Map<String, ColumnDefinition>;

/// A typedef for a single entry in the column definition map,
/// which is a MapEntry where the key is the column ID and the value
/// is the ColumnDefinition object for that column
typedef ColumnDefinitionMapEntry = MapEntry<String, ColumnDefinition>;

/// A typedef for the data row, which is a map where the key is the
/// column ID and the value is the cell value for that column in that row
typedef VDataListDataRow = Map<String, VDataListRowCellData>;

/// A typedef for the list of data rows, which is a list of DataRow objects
typedef VDataListDataRowList = List<VDataListDataRow>;
