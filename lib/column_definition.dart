import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:web_dynamic_list/enums.dart';

class ColumnDefinition extends Equatable {
  final String id;
  final String label;
  final double? width;
  final bool isResizable;
  final ColumnSortState sortState;
  final Widget? rowCellIcon;
  final double rowCellIconSpacing;
  final CustomRowCellIconPlacement rowCellIconPlacement;
  final double columnSpacing;
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
  ];

  ColumnDefinition copyWith({
    String? id,
    String? label,
    double? width,
    bool? isResizable,
    ColumnSortState? sortState,
    Widget? rowCellIcon,
    double? rowCellIconSpacing,
    CustomRowCellIconPlacement? rowCellIconPlacement,
    double? columnSpacing,
  }) {
    return ColumnDefinition(
      id: id ?? this.id,
      label: label ?? this.label,
      width: width ?? this.width,
      isResizable: isResizable ?? this.isResizable,
      sortState: sortState ?? this.sortState,
      rowCellIcon: rowCellIcon ?? this.rowCellIcon,
      rowCellIconSpacing: rowCellIconSpacing ?? this.rowCellIconSpacing,
      rowCellIconPlacement: rowCellIconPlacement ?? this.rowCellIconPlacement,
      columnSpacing: columnSpacing ?? this.columnSpacing,
    );
  }
}
