import 'dart:math';

import 'package:faker/faker.dart';
import 'package:v_data_list/v_data_list/config/column_definition.dart';
import 'package:v_data_list/v_data_list/helpers/column_definition_helper.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_data.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

final faker = Faker();

class GenerateFakeDataHelper {
  static VDataListRowCellData _getValueForColumn(String columnId, bool isEvenRow) {
    switch (columnId) {
      case 'id':
        return VDataListRowCellData(value: faker.guid.guid());
      case 'name':
        return VDataListRowCellData(
          value: faker.person.name(),
          additionalData: isEvenRow ? {'animal': generateRandomAnimalFromArray()} : null,
        );
      case 'email':
        return VDataListRowCellData(value: faker.internet.email());
      case 'phone':
        return VDataListRowCellData(value: faker.phoneNumber.us());
      case 'street':
        return VDataListRowCellData(value: faker.address.streetAddress());
      case 'city':
        return VDataListRowCellData(value: faker.address.city());
      case 'country':
        return VDataListRowCellData(value: faker.address.country());
      default:
        return VDataListRowCellData(value: '');
    }
  }

  static VDataListDataRowList generateData(int rowCount, List<String> columnIds) {
    final List<VDataListDataRow> rows = [];

    for (int i = 0; i < rowCount; i++) {
      final VDataListDataRow rowData = {};
      final isEvenRow = i % 2 == 0;
      for (var columnId in columnIds) {
        rowData[columnId] = _getValueForColumn(columnId, isEvenRow);
      }
      rows.add(Map.from(rowData));
    }
    return rows;
  }

  static String generateRandomAnimalFromArray() {
    const animals = ['Dog', 'Cat', 'Fish', 'Horse', 'Owl', 'Mouse', 'Chicken', 'Bug'];
    final random = Random();
    return animals[random.nextInt(animals.length)];
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

final ColumnDefinitionMap columnDefinitions = ColumnDefinitionHelper.generateColumnDefinitionMap([
  ColumnDefinition(id: 'id', label: 'ID'),
  ColumnDefinition(id: 'name', label: 'Name'),
  ColumnDefinition(id: 'email', label: 'Email'),
  ColumnDefinition(id: 'phone', label: 'Phone'),
  ColumnDefinition(id: 'street', label: 'Street'),
  ColumnDefinition(id: 'city', label: 'City'),
  ColumnDefinition(id: 'country', label: 'Country'),
]);
