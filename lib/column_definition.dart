import 'package:equatable/equatable.dart';

class ColumnDefinition extends Equatable {
  final String id;
  final String label;
  final double? width;
  const ColumnDefinition({required this.id, required this.label, this.width});

  @override
  List<Object?> get props => [id, label, width];

  ColumnDefinition copyWith({String? id, String? label, double? width}) {
    return ColumnDefinition(id: id ?? this.id, label: label ?? this.label, width: width ?? this.width);
  }
}
