import 'package:faker/faker.dart';
import 'package:v_data_list/v_data_list/config/column_definition.dart';
import 'package:v_data_list/v_data_list/helpers/column_definition_helper.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

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

  static VDataListDataRowList generateData(int rowCount, List<String> columnIds) {
    final List<VDataListDataRow> rows = [];

    for (int i = 0; i < rowCount; i++) {
      final VDataListDataRow rowData = {};
      for (var columnId in columnIds) {
        rowData[columnId] = _getValueForColumn(columnId);
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
  'id': ColumnDefinition(id: 'id', label: 'ID', width: null, isResizable: true),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: null, isResizable: true),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: null, isResizable: true),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: null, isResizable: true),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: null, isResizable: true),
  'city': ColumnDefinition(id: 'city', label: 'City', width: null, isResizable: true),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: null, isResizable: true),
};

final ColumnDefinitionMap columnDefsWithWidthResizable = {
  'id': ColumnDefinition(id: 'id', label: 'ID', width: 120, isResizable: true),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: 120, isResizable: true),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: 120, isResizable: true),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: 120, isResizable: true),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: 120, isResizable: true),
  'city': ColumnDefinition(id: 'city', label: 'City', width: 120, isResizable: true),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: 120, isResizable: true),
};

final ColumnDefinitionMap columnDefsWithWidthNotResizable = {
  'id': ColumnDefinition(id: 'id', label: 'ID', width: 120, isResizable: false),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: 120, isResizable: false),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: 120, isResizable: false),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: 120, isResizable: false),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: 120, isResizable: false),
  'city': ColumnDefinition(id: 'city', label: 'City', width: 120, isResizable: false),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: 120, isResizable: false),
};

final ColumnDefinitionMap columnDefsSomeWithWidth = {
  'id': ColumnDefinition(id: 'id', label: 'ID', width: null, isResizable: true),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: 120, isResizable: true),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: null, isResizable: true),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: 120, isResizable: true),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: null, isResizable: true),
  'city': ColumnDefinition(id: 'city', label: 'City', width: 120, isResizable: true),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: null, isResizable: true),
};

final ColumnDefinitionMap columnDefsSomeResizable = {
  'id': ColumnDefinition(id: 'id', label: 'ID', width: null, isResizable: false),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: null, isResizable: true),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: null, isResizable: false),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: null, isResizable: true),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: null, isResizable: false),
  'city': ColumnDefinition(id: 'city', label: 'City', width: null, isResizable: true),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: null, isResizable: false),
};

final ColumnDefinitionMap columnDefsWithColumnsThatArentResizable = {
  'id': ColumnDefinition(id: 'id', label: 'ID', width: null, isResizable: false),
  'name': ColumnDefinition(id: 'name', label: 'Name', width: null, isResizable: false),
  'email': ColumnDefinition(id: 'email', label: 'Email', width: null, isResizable: false),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: null, isResizable: false),
  'street': ColumnDefinition(id: 'street', label: 'Street', width: null, isResizable: false),
  'city': ColumnDefinition(id: 'city', label: 'City', width: null, isResizable: false),
  'country': ColumnDefinition(id: 'country', label: 'Country', width: null, isResizable: false),
};
