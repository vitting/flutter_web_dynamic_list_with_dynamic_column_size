import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'v_data_list_theme.tailor.dart';

@TailorMixin()
class VDataListTheme extends ThemeExtension<VDataListTheme> with _$VDataListThemeTailorMixin {
  const VDataListTheme({
    required this.headerTheme,
    required this.footerTheme,
    required this.rowTheme,
    required this.totalCountTheme,
    required this.resizeHandlerTheme,
    required this.backgroundColor,
    required this.paginationTheme,
  });

  @override
  final Color backgroundColor;

  @override
  final HeaderTheme headerTheme;

  @override
  final FooterTheme footerTheme;

  @override
  final RowTheme rowTheme;

  @override
  final TotalCountTheme totalCountTheme;

  @override
  final ResizeHandlerTheme resizeHandlerTheme;

  @override
  final PaginationTheme paginationTheme;

  static VDataListTheme get defaultTheme => VDataListTheme(
    headerTheme: HeaderTheme.defaultTheme,
    footerTheme: FooterTheme.defaultTheme,
    rowTheme: RowTheme.defaultTheme,
    totalCountTheme: TotalCountTheme.defaultTheme,
    resizeHandlerTheme: ResizeHandlerTheme.defaultTheme,
    paginationTheme: PaginationTheme.defaultTheme,
    backgroundColor: Colors.white,
  );

  static VDataListTheme of(BuildContext context) {
    final theme = Theme.of(context).extension<VDataListTheme>();
    if (theme == null) {
      throw Exception('VDataListTheme not found in context. Make sure to add it to your ThemeData extensions.');
    }
    return theme;
  }
}

@tailorMixinComponent
class HeaderTheme extends ThemeExtension<HeaderTheme> with _$HeaderThemeTailorMixin {
  const HeaderTheme({required this.textStyle, required this.backgroundColor});

  @override
  final TextStyle textStyle;

  @override
  final Color backgroundColor;

  static HeaderTheme get defaultTheme => const HeaderTheme(
    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    backgroundColor: Colors.blue,
  );
}

@tailorMixinComponent
class FooterTheme extends ThemeExtension<FooterTheme> with _$FooterThemeTailorMixin {
  const FooterTheme({required this.backgroundColor});

  @override
  final Color backgroundColor;

  static FooterTheme get defaultTheme => const FooterTheme(backgroundColor: Colors.blue);
}

@tailorMixinComponent
class RowTheme extends ThemeExtension<RowTheme> with _$RowThemeTailorMixin {
  const RowTheme({
    required this.textStyle,
    required this.tooltipBackgroundColor,
    required this.tooltipTextStyle,
    required this.hoverBackgroundColor,
    required this.evenBackgroundColor,
    required this.backgroundColor,
  });

  @override
  final TextStyle textStyle;

  @override
  final Color hoverBackgroundColor;

  @override
  final Color evenBackgroundColor;

  @override
  final Color backgroundColor;

  @override
  final Color tooltipBackgroundColor;

  @override
  final TextStyle tooltipTextStyle;

  static RowTheme get defaultTheme => RowTheme(
    textStyle: const TextStyle(color: Colors.black),
    tooltipBackgroundColor: Colors.grey[700]!,
    tooltipTextStyle: const TextStyle(color: Colors.white),
    hoverBackgroundColor: Colors.grey[400]!,
    evenBackgroundColor: Colors.grey[300]!,
    backgroundColor: Colors.grey[200]!,
  );
}

@tailorMixinComponent
class TotalCountTheme extends ThemeExtension<TotalCountTheme> with _$TotalCountThemeTailorMixin {
  const TotalCountTheme({required this.textStyle, required this.backgroundColor});

  @override
  final TextStyle textStyle;

  @override
  final Color backgroundColor;

  static TotalCountTheme get defaultTheme => const TotalCountTheme(
    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    backgroundColor: Colors.blue,
  );
}

@tailorMixinComponent
class ResizeHandlerTheme extends ThemeExtension<ResizeHandlerTheme> with _$ResizeHandlerThemeTailorMixin {
  const ResizeHandlerTheme({required this.backgroundColor});

  @override
  final Color backgroundColor;

  static ResizeHandlerTheme get defaultTheme => ResizeHandlerTheme(backgroundColor: Colors.grey[300]!);
}

@tailorMixinComponent
class PaginationTheme extends ThemeExtension<PaginationTheme> with _$PaginationThemeTailorMixin {
  const PaginationTheme({
    required this.textStyle,
    required this.backgroundColor,
    required this.selectedItemBackgroundColor,
    required this.selectedTextStyle,
    required this.itemBackgroundColor,
    required this.hoverBackgroundColor,
    required this.hoverTextStyle,
    required this.hoverSelectedTextStyle,
  });

  @override
  final TextStyle textStyle;

  @override
  final TextStyle selectedTextStyle;

  @override
  final Color backgroundColor;

  @override
  final Color selectedItemBackgroundColor;

  @override
  final Color itemBackgroundColor;

  @override
  final Color hoverBackgroundColor;

  @override
  final TextStyle hoverTextStyle;

  @override
  final TextStyle hoverSelectedTextStyle;

  static PaginationTheme get defaultTheme => PaginationTheme(
    backgroundColor: Colors.blue,
    textStyle: const TextStyle(color: Colors.white),
    selectedTextStyle: const TextStyle(color: Colors.black),
    selectedItemBackgroundColor: Colors.grey[300]!,
    itemBackgroundColor: Colors.blue,
    hoverBackgroundColor: Colors.lightBlue,
    hoverTextStyle: const TextStyle(color: Colors.white),
    hoverSelectedTextStyle: const TextStyle(color: Colors.black),
  );
}
