// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'v_data_list_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$VDataListThemeTailorMixin on ThemeExtension<VDataListTheme> {
  Color get backgroundColor;
  HeaderTheme get headerTheme;
  FooterTheme get footerTheme;
  RowTheme get rowTheme;
  RowCellTheme get rowCellTheme;
  TotalCountTheme get totalCountTheme;
  ResizeHandlerTheme get resizeHandlerTheme;
  PaginationTheme get paginationTheme;
  NoDataTheme get noDataTheme;

  @override
  VDataListTheme copyWith({
    Color? backgroundColor,
    HeaderTheme? headerTheme,
    FooterTheme? footerTheme,
    RowTheme? rowTheme,
    RowCellTheme? rowCellTheme,
    TotalCountTheme? totalCountTheme,
    ResizeHandlerTheme? resizeHandlerTheme,
    PaginationTheme? paginationTheme,
    NoDataTheme? noDataTheme,
  }) {
    return VDataListTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerTheme: headerTheme ?? this.headerTheme,
      footerTheme: footerTheme ?? this.footerTheme,
      rowTheme: rowTheme ?? this.rowTheme,
      rowCellTheme: rowCellTheme ?? this.rowCellTheme,
      totalCountTheme: totalCountTheme ?? this.totalCountTheme,
      resizeHandlerTheme: resizeHandlerTheme ?? this.resizeHandlerTheme,
      paginationTheme: paginationTheme ?? this.paginationTheme,
      noDataTheme: noDataTheme ?? this.noDataTheme,
    );
  }

  @override
  VDataListTheme lerp(
    covariant ThemeExtension<VDataListTheme>? other,
    double t,
  ) {
    if (other is! VDataListTheme) return this as VDataListTheme;
    return VDataListTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      headerTheme: headerTheme.lerp(other.headerTheme, t),
      footerTheme: footerTheme.lerp(other.footerTheme, t),
      rowTheme: rowTheme.lerp(other.rowTheme, t),
      rowCellTheme: rowCellTheme.lerp(other.rowCellTheme, t),
      totalCountTheme: totalCountTheme.lerp(other.totalCountTheme, t),
      resizeHandlerTheme: resizeHandlerTheme.lerp(other.resizeHandlerTheme, t),
      paginationTheme: paginationTheme.lerp(other.paginationTheme, t),
      noDataTheme: noDataTheme.lerp(other.noDataTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VDataListTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              headerTheme,
              other.headerTheme,
            ) &&
            const DeepCollectionEquality().equals(
              footerTheme,
              other.footerTheme,
            ) &&
            const DeepCollectionEquality().equals(rowTheme, other.rowTheme) &&
            const DeepCollectionEquality().equals(
              rowCellTheme,
              other.rowCellTheme,
            ) &&
            const DeepCollectionEquality().equals(
              totalCountTheme,
              other.totalCountTheme,
            ) &&
            const DeepCollectionEquality().equals(
              resizeHandlerTheme,
              other.resizeHandlerTheme,
            ) &&
            const DeepCollectionEquality().equals(
              paginationTheme,
              other.paginationTheme,
            ) &&
            const DeepCollectionEquality().equals(
              noDataTheme,
              other.noDataTheme,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(headerTheme),
      const DeepCollectionEquality().hash(footerTheme),
      const DeepCollectionEquality().hash(rowTheme),
      const DeepCollectionEquality().hash(rowCellTheme),
      const DeepCollectionEquality().hash(totalCountTheme),
      const DeepCollectionEquality().hash(resizeHandlerTheme),
      const DeepCollectionEquality().hash(paginationTheme),
      const DeepCollectionEquality().hash(noDataTheme),
    );
  }
}

extension VDataListThemeBuildContextProps on BuildContext {
  VDataListTheme get vDataListTheme =>
      Theme.of(this).extension<VDataListTheme>()!;
  Color get backgroundColor => vDataListTheme.backgroundColor;
  HeaderTheme get headerTheme => vDataListTheme.headerTheme;
  FooterTheme get footerTheme => vDataListTheme.footerTheme;
  RowTheme get rowTheme => vDataListTheme.rowTheme;
  RowCellTheme get rowCellTheme => vDataListTheme.rowCellTheme;
  TotalCountTheme get totalCountTheme => vDataListTheme.totalCountTheme;
  ResizeHandlerTheme get resizeHandlerTheme =>
      vDataListTheme.resizeHandlerTheme;
  PaginationTheme get paginationTheme => vDataListTheme.paginationTheme;
  NoDataTheme get noDataTheme => vDataListTheme.noDataTheme;
}

mixin _$HeaderThemeTailorMixin on ThemeExtension<HeaderTheme> {
  TextStyle get textStyle;
  Color get backgroundColor;

  @override
  HeaderTheme copyWith({TextStyle? textStyle, Color? backgroundColor}) {
    return HeaderTheme(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  HeaderTheme lerp(covariant ThemeExtension<HeaderTheme>? other, double t) {
    if (other is! HeaderTheme) return this as HeaderTheme;
    return HeaderTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HeaderTheme &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(textStyle),
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}

mixin _$FooterThemeTailorMixin on ThemeExtension<FooterTheme> {
  Color get backgroundColor;

  @override
  FooterTheme copyWith({Color? backgroundColor}) {
    return FooterTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  FooterTheme lerp(covariant ThemeExtension<FooterTheme>? other, double t) {
    if (other is! FooterTheme) return this as FooterTheme;
    return FooterTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FooterTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}

mixin _$RowThemeTailorMixin on ThemeExtension<RowTheme> {
  Color get hoverBackgroundColor;
  Color get evenBackgroundColor;
  Color get backgroundColor;

  @override
  RowTheme copyWith({
    Color? hoverBackgroundColor,
    Color? evenBackgroundColor,
    Color? backgroundColor,
  }) {
    return RowTheme(
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      evenBackgroundColor: evenBackgroundColor ?? this.evenBackgroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  RowTheme lerp(covariant ThemeExtension<RowTheme>? other, double t) {
    if (other is! RowTheme) return this as RowTheme;
    return RowTheme(
      hoverBackgroundColor: Color.lerp(
        hoverBackgroundColor,
        other.hoverBackgroundColor,
        t,
      )!,
      evenBackgroundColor: Color.lerp(
        evenBackgroundColor,
        other.evenBackgroundColor,
        t,
      )!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RowTheme &&
            const DeepCollectionEquality().equals(
              hoverBackgroundColor,
              other.hoverBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              evenBackgroundColor,
              other.evenBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(hoverBackgroundColor),
      const DeepCollectionEquality().hash(evenBackgroundColor),
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}

mixin _$RowCellThemeTailorMixin on ThemeExtension<RowCellTheme> {
  TextStyle get textStyle;
  Color get tooltipBackgroundColor;
  TextStyle get tooltipTextStyle;

  @override
  RowCellTheme copyWith({
    TextStyle? textStyle,
    Color? tooltipBackgroundColor,
    TextStyle? tooltipTextStyle,
  }) {
    return RowCellTheme(
      textStyle: textStyle ?? this.textStyle,
      tooltipBackgroundColor:
          tooltipBackgroundColor ?? this.tooltipBackgroundColor,
      tooltipTextStyle: tooltipTextStyle ?? this.tooltipTextStyle,
    );
  }

  @override
  RowCellTheme lerp(covariant ThemeExtension<RowCellTheme>? other, double t) {
    if (other is! RowCellTheme) return this as RowCellTheme;
    return RowCellTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      tooltipBackgroundColor: Color.lerp(
        tooltipBackgroundColor,
        other.tooltipBackgroundColor,
        t,
      )!,
      tooltipTextStyle: TextStyle.lerp(
        tooltipTextStyle,
        other.tooltipTextStyle,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RowCellTheme &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality().equals(
              tooltipBackgroundColor,
              other.tooltipBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              tooltipTextStyle,
              other.tooltipTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(textStyle),
      const DeepCollectionEquality().hash(tooltipBackgroundColor),
      const DeepCollectionEquality().hash(tooltipTextStyle),
    );
  }
}

mixin _$TotalCountThemeTailorMixin on ThemeExtension<TotalCountTheme> {
  TextStyle get textStyle;
  Color get backgroundColor;

  @override
  TotalCountTheme copyWith({TextStyle? textStyle, Color? backgroundColor}) {
    return TotalCountTheme(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  TotalCountTheme lerp(
    covariant ThemeExtension<TotalCountTheme>? other,
    double t,
  ) {
    if (other is! TotalCountTheme) return this as TotalCountTheme;
    return TotalCountTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TotalCountTheme &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(textStyle),
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}

mixin _$ResizeHandlerThemeTailorMixin on ThemeExtension<ResizeHandlerTheme> {
  Color get backgroundColor;

  @override
  ResizeHandlerTheme copyWith({Color? backgroundColor}) {
    return ResizeHandlerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ResizeHandlerTheme lerp(
    covariant ThemeExtension<ResizeHandlerTheme>? other,
    double t,
  ) {
    if (other is! ResizeHandlerTheme) return this as ResizeHandlerTheme;
    return ResizeHandlerTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResizeHandlerTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}

mixin _$PaginationThemeTailorMixin on ThemeExtension<PaginationTheme> {
  TextStyle get textStyle;
  TextStyle get selectedTextStyle;
  Color get backgroundColor;
  Color get selectedItemBackgroundColor;
  Color get itemBackgroundColor;
  Color get hoverBackgroundColor;
  TextStyle get hoverTextStyle;
  TextStyle get hoverSelectedTextStyle;

  @override
  PaginationTheme copyWith({
    TextStyle? textStyle,
    TextStyle? selectedTextStyle,
    Color? backgroundColor,
    Color? selectedItemBackgroundColor,
    Color? itemBackgroundColor,
    Color? hoverBackgroundColor,
    TextStyle? hoverTextStyle,
    TextStyle? hoverSelectedTextStyle,
  }) {
    return PaginationTheme(
      textStyle: textStyle ?? this.textStyle,
      selectedTextStyle: selectedTextStyle ?? this.selectedTextStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedItemBackgroundColor:
          selectedItemBackgroundColor ?? this.selectedItemBackgroundColor,
      itemBackgroundColor: itemBackgroundColor ?? this.itemBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      hoverTextStyle: hoverTextStyle ?? this.hoverTextStyle,
      hoverSelectedTextStyle:
          hoverSelectedTextStyle ?? this.hoverSelectedTextStyle,
    );
  }

  @override
  PaginationTheme lerp(
    covariant ThemeExtension<PaginationTheme>? other,
    double t,
  ) {
    if (other is! PaginationTheme) return this as PaginationTheme;
    return PaginationTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      selectedTextStyle: TextStyle.lerp(
        selectedTextStyle,
        other.selectedTextStyle,
        t,
      )!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      selectedItemBackgroundColor: Color.lerp(
        selectedItemBackgroundColor,
        other.selectedItemBackgroundColor,
        t,
      )!,
      itemBackgroundColor: Color.lerp(
        itemBackgroundColor,
        other.itemBackgroundColor,
        t,
      )!,
      hoverBackgroundColor: Color.lerp(
        hoverBackgroundColor,
        other.hoverBackgroundColor,
        t,
      )!,
      hoverTextStyle: TextStyle.lerp(hoverTextStyle, other.hoverTextStyle, t)!,
      hoverSelectedTextStyle: TextStyle.lerp(
        hoverSelectedTextStyle,
        other.hoverSelectedTextStyle,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationTheme &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality().equals(
              selectedTextStyle,
              other.selectedTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              selectedItemBackgroundColor,
              other.selectedItemBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              itemBackgroundColor,
              other.itemBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              hoverBackgroundColor,
              other.hoverBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              hoverTextStyle,
              other.hoverTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              hoverSelectedTextStyle,
              other.hoverSelectedTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(textStyle),
      const DeepCollectionEquality().hash(selectedTextStyle),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(selectedItemBackgroundColor),
      const DeepCollectionEquality().hash(itemBackgroundColor),
      const DeepCollectionEquality().hash(hoverBackgroundColor),
      const DeepCollectionEquality().hash(hoverTextStyle),
      const DeepCollectionEquality().hash(hoverSelectedTextStyle),
    );
  }
}

mixin _$NoDataThemeTailorMixin on ThemeExtension<NoDataTheme> {
  TextStyle get textStyle;
  Color get backgroundColor;

  @override
  NoDataTheme copyWith({TextStyle? textStyle, Color? backgroundColor}) {
    return NoDataTheme(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  NoDataTheme lerp(covariant ThemeExtension<NoDataTheme>? other, double t) {
    if (other is! NoDataTheme) return this as NoDataTheme;
    return NoDataTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoDataTheme &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(textStyle),
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}
