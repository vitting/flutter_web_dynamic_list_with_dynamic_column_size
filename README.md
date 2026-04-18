# VDataList

A Flutter web application demonstrating a dynamic data list component with resizable columns, pagination, and various interactive features.

## Features

- **Resizable columns**: Drag column borders to adjust width
- **Dynamic data**: Support for different data types and configurations
- **Pagination**: Built-in pagination support
- **Lazy loading**: Efficient loading for large datasets
- **Interactive rows**: Click and long-press interactions
- **Custom styling**: Flexible Theming and cell styling
- **Responsive design**: Optimized for web browsers

## Getting Started

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run -d web` to start the example web application

## Examples

### Basic Example

The core component is `VDataList` which accepts:

```dart
final ColumnDefinitionMap columnDefinitions = {
  'id': ColumnDefinition(id: 'id', label: 'ID'),
  'name': ColumnDefinition(id: 'name', label: 'Name'),
  'email': ColumnDefinition(id: 'email', label: 'Email'),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone'),
  'street': ColumnDefinition(id: 'street', label: 'Street'),
  'city': ColumnDefinition(id: 'city', label: 'City'),
  'country': ColumnDefinition(id: 'country', label: 'Country'),
};
```

or you can use the `ColumnDefinitionHelper`. It creates the `ColumnDefinitionMap` from the id's

```dart
final ColumnDefinitionMap columnDefinitions = ColumnDefinitionHelper.generateColumnDefinitionMap([
  ColumnDefinition(id: 'id', label: 'ID'),
  ColumnDefinition(id: 'name', label: 'Name'),
  ColumnDefinition(id: 'email', label: 'Email'),
  ColumnDefinition(id: 'phone', label: 'Phone'),
  ColumnDefinition(id: 'street', label: 'Street'),
  ColumnDefinition(id: 'city', label: 'City'),
  ColumnDefinition(id: 'country', label: 'Country'),
]);
```

#### ColumnDefinition Properties

<!-- markdownlint-disable MD060 -->
The `ColumnDefinition` class supports the following properties:

| Property                 | Type                   | Required | Default | Description                                                               |
| ------------------------ | ---------------------- | -------- | ------- | ------------------------------------------------------------------------- |
| `id`                     | `String`               | ✅        | -       | Unique identifier for the column. Used to match column with row data.     |
| `label`                  | `String`               | ✅        | -       | Display label shown in the column header.                                 |
| `width`                  | `double?`              | ❌        | `null`  | Fixed width of the column. If `null`, column auto-sizes based on content. |
| `isResizable`            | `bool`                 | ❌        | `true`  | Whether users can resize the column by dragging the column border.        |
| `sortState`              | `ColumnSortState`      | ❌        | `none`  | Current sort state: `none`, `ascending`, or `descending`.                 |
| `rowCellIcon`            | `Widget?`              | ❌        | `null`  | Optional icon to display in each cell of this column.                     |
| `rowCellIconSpacing`     | `double`               | ❌        | `0`     | Spacing between the icon and cell content when `rowCellIcon` is provided. |
| `rowCellIconPlacement`   | `RowCellIconPlacement` | ❌        | `left`  | Icon placement: `left` or `right` of the cell content.                    |
| `columnSpacing`          | `double`               | ❌        | `0`     | Spacing to the right of the column (not applied to the last column).      |
| `type`                   | `ColumnDefinitionType` | ❌        | `text`  | Column type: `text`, `number`, `date`, or `custom`.                       |
| `resizableHandlerPinned` | `bool`                 | ❌        | `false` | Whether the resize handler of this column is pinned.                      |

**Example with all properties:**

```dart
ColumnDefinition(
  id: 'name',
  label: 'Full Name',
  width: 200.0,
  isResizable: true,
  sortState: ColumnSortState.ascending,
  rowCellIcon: Icon(Icons.person),
  rowCellIconSpacing: 8.0,
  rowCellIconPlacement: RowCellIconPlacement.left,
  columnSpacing: 16.0,
  type: ColumnDefinitionType.text,
  resizableHandlerPinned: false,
)
```

#### Usage

```dart
VDataList(
  columnDefs: columnDefinitions,  // Map of column configurations
  data: rowData,                  // List of row data
  totalItems: totalCount,         // Total number of items
  config: VDataListConfig(),      // Configuration options
  onRowTap: (rowData, column) {   // Row interaction callback
    // Handle row tap
  },
)
```
