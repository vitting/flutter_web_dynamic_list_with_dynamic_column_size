import 'package:faker/faker.dart';
import 'package:web_dynamic_list/config/column_definition.dart';
import 'package:web_dynamic_list/helpers/column_definition_helper.dart';
import 'package:web_dynamic_list/v_data_list_type_definitions.dart';

final faker = Faker();

class GenerateFakeDataHelper {
  static String _getValueForColumn(String columnId) {
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

  static DataRowList generateData(int rowCount, List<String> columnIds) {
    final List<DataRow> rows = [];

    for (int i = 0; i < rowCount; i++) {
      final DataRow rowData = {};
      for (var columnId in columnIds) {
        if (i == 0) {
          rowData[columnId] = 'first';
        } else if (i == rowCount - 1) {
          rowData[columnId] = 'last';
        } else {
          rowData[columnId] = _getValueForColumn(columnId);
        }
      }
      rows.add(Map.from(rowData));
    }
    return rows;
  }
}

final ColumnDefinitionMap columnDefWithAllColumnsResizable = ColumnDefinitionHelper.generateColumnDefinitionMap([
  ColumnDefinition(id: 'id', label: 'ID', width: null, isResizable: false),
  ColumnDefinition(id: 'name', label: 'Name', width: null, isResizable: false),
  ColumnDefinition(id: 'email', label: 'Email', width: null, isResizable: false),
]);

final ColumnDefinitionMap columnDefs = {
  'id': ColumnDefinition(id: 'id', label: 'ID', width: null),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: null),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: null),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: null),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: null),
  'city': ColumnDefinition(id: 'city', label: 'City', width: null),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: null),
};

final ColumnDefinitionMap columnDefsWithColumnsThatArentResizable = {
  'id': ColumnDefinition(id: 'id', label: 'ID', width: 100, isResizable: false),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: null),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: null, isResizable: false),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: null),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: null, isResizable: false),
  'city': ColumnDefinition(id: 'city', label: 'City', width: null),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: null, isResizable: false),
};
