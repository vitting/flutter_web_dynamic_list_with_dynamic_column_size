import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:web_dynamic_list/enums.dart';

class ColumnDefinition extends Equatable {
  /// The spacing to the right of the column.
  /// This is used to create space between columns.
  /// The last column will not have spacing applied to it.
  final double columnSpacing;

  /// The unique identifier for the column.
  /// This is used to match the column with the data in the rows.
  final String id;

  /// Whether the column is resizable or not.
  /// If true, the user can resize the column by dragging the edge of the column header.
  /// If false, the column will have a fixed width.
  final bool isResizable;

  /// The label of the column.
  /// This is displayed in the column header and can be used to identify the column.
  final String label;

  /// An optional icon to display in each cell of this column.
  /// This can be used to add visual cues to the cells in this column.
  final Widget? rowCellIcon;

  /// The spacing between the icon and the cell content when [rowCellIcon] is provided.
  final CustomRowCellIconPlacement rowCellIconPlacement;

  /// The spacing between the icon and the cell content when [rowCellIcon] is provided.
  final double rowCellIconSpacing;

  /// The current sort state of the column.
  /// This is used to determine how to display the sort icon in the column
  /// header and can be used to sort the data in the rows when the column header is tapped.
  final ColumnSortState sortState;

  /// The width of the column.
  /// If null, the column will auto-size based on its content.
  /// If not null, the column will have a fixed width.
  final double? width;

  /// The type of the column, which can be used to determine how to render the cells in this column.
  final ColumnDefinitionType type;

  const ColumnDefinition({
    required this.id,
    required this.label,
    this.width,
    this.isResizable = true,
    this.sortState = ColumnSortState.none,
    this.rowCellIcon,
    this.rowCellIconSpacing = 0,
    this.columnSpacing = 0,
    this.rowCellIconPlacement = CustomRowCellIconPlacement.right,
    this.type = ColumnDefinitionType.text,
  });

  @override
  List<Object?> get props => [
    id,
    label,
    width,
    isResizable,
    sortState,
    rowCellIcon,
    rowCellIconSpacing,
    columnSpacing,
    rowCellIconPlacement,
    type,
  ];

  @override
  String toString() {
    return 'ColumnDefinition(columnSpacing: $columnSpacing, id: $id, isResizable: $isResizable, label: $label, rowCellIcon: $rowCellIcon, rowCellIconPlacement: $rowCellIconPlacement, rowCellIconSpacing: $rowCellIconSpacing, sortState: $sortState, width: $width, type: $type)';
  }

  ColumnDefinition setWidth(double? newWidth) {
    return ColumnDefinition(
      id: id,
      label: label,
      width: newWidth,
      isResizable: isResizable,
      sortState: sortState,
      rowCellIcon: rowCellIcon,
      rowCellIconSpacing: rowCellIconSpacing,
      rowCellIconPlacement: rowCellIconPlacement,
      columnSpacing: columnSpacing,
      type: type,
    );
  }

  ColumnDefinition copyWith({
    double? columnSpacing,
    String? id,
    bool? isResizable,
    String? label,
    Widget? rowCellIcon,
    CustomRowCellIconPlacement? rowCellIconPlacement,
    double? rowCellIconSpacing,
    ColumnSortState? sortState,
    double? width,
    ColumnDefinitionType? type,
  }) {
    return ColumnDefinition(
      columnSpacing: columnSpacing ?? this.columnSpacing,
      id: id ?? this.id,
      isResizable: isResizable ?? this.isResizable,
      label: label ?? this.label,
      rowCellIcon: rowCellIcon ?? this.rowCellIcon,
      rowCellIconPlacement: rowCellIconPlacement ?? this.rowCellIconPlacement,
      rowCellIconSpacing: rowCellIconSpacing ?? this.rowCellIconSpacing,
      sortState: sortState ?? this.sortState,
      width: width ?? this.width,
      type: type ?? this.type,
    );
  }
}
