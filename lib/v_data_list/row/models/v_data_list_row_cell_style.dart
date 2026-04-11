import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';

class VDataListRowCellStyle extends Equatable {
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Widget? icon;
  final RowCellIconPlacement? iconPlacement;

  const VDataListRowCellStyle({
    this.backgroundColor,
    this.textColor,
    this.fontWeight,
    this.fontStyle,
    this.icon,
    this.iconPlacement,
  });

  @override
  List<Object?> get props => [backgroundColor, textColor, fontWeight, fontStyle, icon, iconPlacement];

  @override
  String toString() {
    return 'VDataListRowCellStyle(backgroundColor: $backgroundColor, textColor: $textColor, fontWeight: $fontWeight, fontStyle: $fontStyle, icon: $icon, iconPlacement: $iconPlacement)';
  }
}
