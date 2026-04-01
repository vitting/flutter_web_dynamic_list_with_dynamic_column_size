import 'package:equatable/equatable.dart';

import 'package:web_dynamic_list/enums.dart';

class ColumnDefinition extends Equatable {
  final String id;
  final String label;
  final double? width;
  final bool isResizable;
  final ColumnSortState sortState;
  const ColumnDefinition({
    required this.id,
    required this.label,
    this.width,
    this.isResizable = true,
    this.sortState = ColumnSortState.none,
  });

  @override
  List<Object?> get props => [id, label, width];

  ColumnDefinition copyWith({String? id, String? label, double? width, bool? isResizable, ColumnSortState? sortState}) {
    return ColumnDefinition(
      id: id ?? this.id,
      label: label ?? this.label,
      width: width ?? this.width,
      isResizable: isResizable ?? this.isResizable,
      sortState: sortState ?? this.sortState,
    );
  }
}
