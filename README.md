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

#### ColumnDefinition

First define the structure of your data which is done by defining a list of columnDefinitions

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

or you can use the `ColumnDefinitionHelper`. It creates the `ColumnDefinitionMap` from the id's in the ColumnDefinition

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

#### VDataListDataRowList

Then organize your data into a structure of `VDataListDataRowList`

```dart
final VDataListDataRowList data = [
  {
    'id': VDataListRowCellData(value: '1'),
    'name': VDataListRowCellData(value: 'John Doe'),
    'email': VDataListRowCellData(value: 'example@email.com'),
    'phone': VDataListRowCellData(value: '123-456-7890'),
    'street': VDataListRowCellData(value: '123 Main St'),
    'city': VDataListRowCellData(value: 'Any town'),
    'country': VDataListRowCellData(value: 'USA'),
  },
  {
    'id': VDataListRowCellData(value: '2'),
    'name': VDataListRowCellData(value: 'Jane Smith'),
    'email': VDataListRowCellData(value: 'another_email@example.com'),
    'phone': VDataListRowCellData(value: '987-654-3210'),
    'street': VDataListRowCellData(value: '456 Elm St'),
    'city': VDataListRowCellData(value: 'Other town'),
    'country': VDataListRowCellData(value: 'Canada'),
  },
];
```

or if you have data in a structure of List of lists then you can use `DataRowHelper.generateDataRowListFromListOfData`

```dart
final VDataListDataRowList data = DataRowHelper.generateDataRowListFromListOfData(columnDefinitions, [
  ['1', 'John Doe', 'example@email.com', '123-456-7890', '123 Main St', 'Any town', 'USA'],
  ['2', 'Jane Smith', 'another_email@example.com', '987-654-3210', '456 Elm St', 'Other town', 'Canada'],
]);
```

#### VDataList widget

```dart
VDataList(
    columnDefs: columnDefinitions,
    config: VDataListConfig(),
    data: data,
),
```

Thats all!!!

## ColumnDefinition Properties

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

## VDataList Properties

<!-- markdownlint-disable MD060 -->
The `VDataList` widget supports the following properties:

### Required Properties

| Property     | Type                  | Description                                                              |
| ------------ | --------------------- | ------------------------------------------------------------------------ |
| `columnDefs` | `ColumnDefinitionMap` | Column definitions that define columns to display and their properties.  |
| `config`     | `VDataListConfig`     | Configuration settings for appearance and behavior of the list.          |
| `totalItems` | `int`                 | Total number of items (used for pagination and load more functionality). |

### Data Properties

| Property | Type                   | Required | Default | Description                                                            |
| -------- | ---------------------- | -------- | ------- | ---------------------------------------------------------------------- |
| `data`   | `VDataListDataRowList` | ❌        | `[]`    | The data to display in rows. Each row should match column definitions. |
| `noData` | `Widget?`              | ❌        | `null`  | Custom widget to display when there is no data.                        |

### Loading & Pagination Properties

| Property                 | Type   | Required | Default | Description                                                  |
| ------------------------ | ------ | -------- | ------- | ------------------------------------------------------------ |
| `isLoading`              | `bool` | ❌        | `false` | Flag indicating whether more data is currently being loaded. |
| `paginationCurrentPage`  | `int?` | ❌        | `null`  | Current page index for pagination (zero-based).              |
| `paginationItemsPerPage` | `int?` | ❌        | `null`  | Number of items per page for pagination controls.            |

### Callback Properties

| Property                   | Type                                                                             | Description                                                     |
| -------------------------- | -------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `onRowTap`                 | `void Function(VDataListDataRow, ColumnDefinitionMap)?`                          | Called when a row is tapped.                                    |
| `onColumnDefsChanged`      | `void Function(ColumnDefinitionMap)?`                                            | Called when column definitions change (e.g., after resizing).   |
| `onSortChanged`            | `void Function(String id, ColumnSortState, ColumnDefinitionMap)?`                | Called when column sort state changes.                          |
| `onLongPress`              | `void Function(VDataListDataRow, ColumnDefinitionMap)?`                          | Called when a row is long-pressed.                              |
| `onLongPressRow`           | `void Function(String id, String value, VDataListDataRow, ColumnDefinitionMap)?` | Called when a specific cell is long-pressed.                    |
| `onLongPressRowCopyValue`  | `void Function(String id, String value, VDataListDataRow, ColumnDefinitionMap)?` | Called when a cell value is copied via long press.              |
| `onLoadMore`               | `void Function()?`                                                               | Called when user scrolls to end of list for infinite scrolling. |
| `onPaginationIndexChanged` | `void Function(int page, int totalItems, int pageSize)?`                         | Called when pagination page changes.                            |

### Styling Properties

| Property              | Type                                                                                             | Description                                                  |
| --------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| `rowCellStyleBuilder` | `VDataListRowCellStyle? Function(BuildContext, String, VDataListRowCellData, ColumnDefinition)?` | Builder for custom cell styling based on content and column. |

### UI Component Properties

| Property        | Type      | Description                                            |
| --------------- | --------- | ------------------------------------------------------ |
| `footer`        | `Widget?` | Custom footer widget displayed below the list content. |
| `resizeHandler` | `Widget?` | Custom resize handler widget for column resizing.      |
| `totalCount`    | `Widget?` | Custom widget for displaying total count information.  |

#### VDataListConfig Properties

<!-- markdownlint-disable MD060 -->

## VDataListConfig properties

The `VDataListConfig` class provides extensive customization options for the VDataList appearance and behavior:

### Header & Layout Properties

| Property              | Type                   | Default                                | Description                                              |
| --------------------- | ---------------------- | -------------------------------------- | -------------------------------------------------------- |
| `pinHeader`           | `bool`                 | `true`                                 | Whether the header should remain visible when scrolling. |
| `headerBorderRadius`  | `BorderRadiusGeometry` | `BorderRadius.all(Radius.circular(8))` | Border radius for the header row.                        |
| `headerBottomSpacing` | `double`               | `4`                                    | Spacing between the header and the first row.            |
| `headerPadding`       | `EdgeInsetsGeometry`   | `EdgeInsets.all(8)`                    | Padding for the header row.                              |

### Row Styling Properties

| Property                     | Type                   | Default                                            | Description                                                                |
| ---------------------------- | ---------------------- | -------------------------------------------------- | -------------------------------------------------------------------------- |
| `rowBorderRadius`            | `BorderRadiusGeometry` | `BorderRadius.all(Radius.circular(8))`             | Border radius for data rows.                                               |
| `rowPadding`                 | `EdgeInsetsGeometry`   | `EdgeInsets.symmetric(horizontal: 8, vertical: 4)` | Padding for each row in the list.                                          |
| `rowSpacing`                 | `double`               | `5`                                                | Spacing between rows in the list.                                          |
| `showRowEvenBackgroundColor` | `bool`                 | `true`                                             | Whether to show different background color for even rows (striped effect). |
| `showRowHoverColor`          | `bool`                 | `true`                                             | Whether to show hover background color for rows.                           |

### Row Interaction Properties

| Property                                    | Type     | Default                                     | Description                                                              |
| ------------------------------------------- | -------- | ------------------------------------------- | ------------------------------------------------------------------------ |
| `showRowClickHandler`                       | `bool`   | `false`                                     | Whether to show a click handler icon at the end of each row.             |
| `rowClickHandlerIcon`                       | `Widget` | `Icon(Symbols.arrow_forward_ios, size: 16)` | Icon to show in the row click handler.                                   |
| `rowClickHandlerWidth`                      | `double` | `45`                                        | Width of the row click handler area.                                     |
| `triggerOnRowTapWhenRowClickHandlerIsShown` | `bool`   | `false`                                     | Whether tapping the row triggers `onRowTap` when click handler is shown. |
| `longPressToCopyCellValueToClipboard`       | `bool`   | `true`                                      | Whether long pressing a cell copies its value to clipboard.              |

### Text & Content Properties

| Property           | Type      | Default               | Description                                                  |
| ------------------ | --------- | --------------------- | ------------------------------------------------------------ |
| `textIsSelectable` | `bool`    | `false`               | Whether text in cells should be selectable.                  |
| `showTooltip`      | `bool`    | `true`                | Whether to show tooltips with full cell value when hovering. |
| `noDataMessage`    | `String?` | `"No data available"` | Message to show when there is no data to display.            |

### Sorting Properties

| Property                | Type     | Default                                                           | Description                                        |
| ----------------------- | -------- | ----------------------------------------------------------------- | -------------------------------------------------- |
| `showSortIconsInHeader` | `bool`   | `true`                                                            | Whether to show sort icons in headers when sorted. |
| `sortIconAscending`     | `Widget` | `Icon(Symbols.arrow_upward_alt, color: Colors.white, size: 16)`   | Icon for ascending sort state.                     |
| `sortIconDescending`    | `Widget` | `Icon(Symbols.arrow_downward_alt, color: Colors.white, size: 16)` | Icon for descending sort state.                    |

### Column Resize Properties

| Property                         | Type                  | Default                                  | Description                                                          |
| -------------------------------- | --------------------- | ---------------------------------------- | -------------------------------------------------------------------- |
| `canResetColumnWidthOnLongPress` | `bool`                | `true`                                   | Whether long pressing resize handler resets column to dynamic width. |
| `resizeHandlerIcon`              | `Widget?`             | `Icon(Symbols.arrows_outward, size: 12)` | Icon to use as the resize handler.                                   |
| `resizeHandlerMargin`            | `EdgeInsetsGeometry?` | `EdgeInsets.only(right: 8)`              | Margin for resize handlers.                                          |
| `resizeHandlerPadding`           | `EdgeInsetsGeometry?` | `EdgeInsets.all(4)`                      | Padding for resize handlers.                                         |

### Pagination Properties

| Property                 | Type                   | Default                                | Description                                       |
| ------------------------ | ---------------------- | -------------------------------------- | ------------------------------------------------- |
| `showPagination`         | `bool`                 | `false`                                | Whether to show pagination controls.              |
| `paginationBorderRadius` | `BorderRadiusGeometry` | `BorderRadius.all(Radius.circular(8))` | Border radius for pagination controls.            |
| `paginationMargin`       | `EdgeInsetsGeometry`   | `EdgeInsets.symmetric(vertical: 4)`    | Margin for pagination controls.                   |
| `paginationPadding`      | `EdgeInsetsGeometry`   | `EdgeInsets.all(8)`                    | Padding for pagination controls.                  |
| `paginationPinned`       | `bool`                 | `false`                                | Whether pagination scrolls with the list content. |

### Total Count Properties

| Property                  | Type                   | Default                                            | Description                                            |
| ------------------------- | ---------------------- | -------------------------------------------------- | ------------------------------------------------------ |
| `showTotalCount`          | `bool`                 | `false`                                            | Whether to show total count of items.                  |
| `showTotalCountPinned`    | `bool`                 | `false`                                            | Whether to pin total count display.                    |
| `totalItemsPosition`      | `TotalCountPosition`   | `TotalCountPosition.top`                           | Position to show total items count: `top` or `bottom`. |
| `totalCountBorderRadius`  | `BorderRadiusGeometry` | `BorderRadius.all(Radius.circular(8))`             | Border radius for total count display.                 |
| `totalCountBottomSpacing` | `double`               | `4`                                                | Spacing below the total count display.                 |
| `totalCountPadding`       | `EdgeInsetsGeometry?`  | `EdgeInsets.symmetric(horizontal: 8, vertical: 8)` | Padding for total count display.                       |

### Footer Properties

| Property             | Type                   | Default                                | Description                                   |
| -------------------- | ---------------------- | -------------------------------------- | --------------------------------------------- |
| `footerBorderRadius` | `BorderRadiusGeometry` | `BorderRadius.all(Radius.circular(8))` | Border radius for the footer.                 |
| `footerMargin`       | `EdgeInsetsGeometry`   | `EdgeInsets.symmetric(vertical: 4)`    | Margin for the footer.                        |
| `footerPadding`      | `EdgeInsetsGeometry`   | `EdgeInsets.all(8)`                    | Padding for the footer.                       |
| `footerPinned`       | `bool`                 | `false`                                | Whether footer scrolls with the list content. |

### Loading & Scrolling Properties

| Property                          | Type     | Default | Description                                                         |
| --------------------------------- | -------- | ------- | ------------------------------------------------------------------- |
| `loadMoreThresholdScrollDistance` | `double` | `0.5`   | Scroll distance (0-1) from bottom to trigger `onLoadMore` callback. |

### Styling Border Radius Properties

| Property              | Type                   | Default                                | Description                       |
| --------------------- | ---------------------- | -------------------------------------- | --------------------------------- |
| `tooltipBorderRadius` | `BorderRadiusGeometry` | `BorderRadius.all(Radius.circular(8))` | Border radius for tooltips.       |
| `noDataBorderRadius`  | `BorderRadiusGeometry` | `BorderRadius.all(Radius.circular(8))` | Border radius for no data widget. |

**Basic Configuration Example:**

```dart
VDataListConfig(
  pinHeader: true,
  showRowHoverColor: true,
  showSortIconsInHeader: true,
  textIsSelectable: true,
)
```

**Advanced Configuration Example:**

```dart
VDataListConfig(
  // Header styling
  pinHeader: true,
  headerBorderRadius: BorderRadius.circular(12),
  headerPadding: EdgeInsets.all(16),
  
  // Row styling
  rowSpacing: 8,
  showRowEvenBackgroundColor: true,
  showRowHoverColor: true,
  
  // Pagination
  showPagination: true,
  paginationPinned: true,
  
  // Total count
  showTotalCount: true,
  totalItemsPosition: TotalCountPosition.top,
  
  // Interaction
  longPressToCopyCellValueToClipboard: true,
  showRowClickHandler: true,
  
  // Custom icons
  sortIconAscending: Icon(Icons.keyboard_arrow_up),
  sortIconDescending: Icon(Icons.keyboard_arrow_down),
  resizeHandlerIcon: Icon(Icons.drag_indicator, size: 14),
)
```
