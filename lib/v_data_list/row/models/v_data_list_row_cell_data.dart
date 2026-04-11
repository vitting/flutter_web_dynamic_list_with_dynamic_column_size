import 'package:equatable/equatable.dart';

class VDataListRowCellData extends Equatable {
  final String value;
  final Map<String, dynamic>? additionalData;

  const VDataListRowCellData({required this.value, this.additionalData});

  @override
  List<Object?> get props => [value, additionalData];

  @override
  String toString() => 'VDataListRowCellData(value: $value, additionalData: $additionalData)';
}
