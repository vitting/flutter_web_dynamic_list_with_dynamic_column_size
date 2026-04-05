// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'v_data_list_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$VDataListThemeTailorMixin on ThemeExtension<VDataListTheme> {
  HeaderTheme get headerTheme;
  FooterTheme get footerTheme;
  RowTheme get rowTheme;
  TotalCountTheme get totalCountTheme;
  ResizeHandlerTheme get resizeHandlerTheme;

  @override
  VDataListTheme copyWith({
    HeaderTheme? headerTheme,
    FooterTheme? footerTheme,
    RowTheme? rowTheme,
    TotalCountTheme? totalCountTheme,
    ResizeHandlerTheme? resizeHandlerTheme,
  }) {
    return VDataListTheme(
      headerTheme: headerTheme ?? this.headerTheme,
      footerTheme: footerTheme ?? this.footerTheme,
      rowTheme: rowTheme ?? this.rowTheme,
      totalCountTheme: totalCountTheme ?? this.totalCountTheme,
      resizeHandlerTheme: resizeHandlerTheme ?? this.resizeHandlerTheme,
    );
  }

  @override
  VDataListTheme lerp(
    covariant ThemeExtension<VDataListTheme>? other,
    double t,
  ) {
    if (other is! VDataListTheme) return this as VDataListTheme;
    return VDataListTheme(
      headerTheme: headerTheme.lerp(other.headerTheme, t),
      footerTheme: footerTheme.lerp(other.footerTheme, t),
      rowTheme: rowTheme.lerp(other.rowTheme, t),
      totalCountTheme: totalCountTheme.lerp(other.totalCountTheme, t),
      resizeHandlerTheme: resizeHandlerTheme.lerp(other.resizeHandlerTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VDataListTheme &&
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
              totalCountTheme,
              other.totalCountTheme,
            ) &&
            const DeepCollectionEquality().equals(
              resizeHandlerTheme,
              other.resizeHandlerTheme,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(headerTheme),
      const DeepCollectionEquality().hash(footerTheme),
      const DeepCollectionEquality().hash(rowTheme),
      const DeepCollectionEquality().hash(totalCountTheme),
      const DeepCollectionEquality().hash(resizeHandlerTheme),
    );
  }
}

extension VDataListThemeBuildContextProps on BuildContext {
  VDataListTheme get vDataListTheme =>
      Theme.of(this).extension<VDataListTheme>()!;
  HeaderTheme get headerTheme => vDataListTheme.headerTheme;
  FooterTheme get footerTheme => vDataListTheme.footerTheme;
  RowTheme get rowTheme => vDataListTheme.rowTheme;
  TotalCountTheme get totalCountTheme => vDataListTheme.totalCountTheme;
  ResizeHandlerTheme get resizeHandlerTheme =>
      vDataListTheme.resizeHandlerTheme;
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
  TextStyle get textStyle;
  Color get hoverBackgroundColor;
  Color get evenBackgroundColor;
  Color get backgroundColor;
  Color get tooltipBackgroundColor;
  TextStyle get tooltipTextStyle;

  @override
  RowTheme copyWith({
    TextStyle? textStyle,
    Color? hoverBackgroundColor,
    Color? evenBackgroundColor,
    Color? backgroundColor,
    Color? tooltipBackgroundColor,
    TextStyle? tooltipTextStyle,
  }) {
    return RowTheme(
      textStyle: textStyle ?? this.textStyle,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      evenBackgroundColor: evenBackgroundColor ?? this.evenBackgroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      tooltipBackgroundColor:
          tooltipBackgroundColor ?? this.tooltipBackgroundColor,
      tooltipTextStyle: tooltipTextStyle ?? this.tooltipTextStyle,
    );
  }

  @override
  RowTheme lerp(covariant ThemeExtension<RowTheme>? other, double t) {
    if (other is! RowTheme) return this as RowTheme;
    return RowTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
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
            other is RowTheme &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
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
            ) &&
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
      const DeepCollectionEquality().hash(hoverBackgroundColor),
      const DeepCollectionEquality().hash(evenBackgroundColor),
      const DeepCollectionEquality().hash(backgroundColor),
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
