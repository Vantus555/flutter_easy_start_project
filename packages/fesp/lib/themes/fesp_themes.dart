import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';

class FespTheme {
  static final _lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff1145a4),
      primaryContainer: Color(0xffacc7f6),
      secondary: Color(0xffb61d1d),
      secondaryContainer: Color(0xffec9f9f),
      tertiary: Color(0xff376bca),
      tertiaryContainer: Color(0xffcfdbf2),
      appBarColor: Color(0xffcfdbf2),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  );

  static final _darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xffc4d7f8),
      primaryContainer: Color(0xff577cbf),
      secondary: Color(0xfff1bbbb),
      secondaryContainer: Color(0xffcb6060),
      tertiary: Color(0xffdde5f5),
      tertiaryContainer: Color(0xff7297d9),
      appBarColor: Color(0xffdde5f5),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  );

  static ThemeData _getTheme(ThemeData theme) {
    return theme.copyWith(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 30,
        ),
      ),
      listTileTheme: ListTileThemeData(shape: FESP_SHAPE),
      checkboxTheme: CheckboxThemeData(shape: FESP_SHAPE),
      visualDensity: VisualDensity.compact,
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        border: FESP_TEXT_INPUT_BORDER,
        contentPadding: FESP_TEXT_INPUT_CONTENT_PADDING,
      ),
    );
  }

  static final lightTheme = _getTheme(_lightTheme);
  static final darkTheme = _getTheme(_darkTheme);
}
