import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.accent1,
      onSecondary: AppColors.onAccent1,
      error: AppColors.error,
      onError: AppColors.onError,
      background: AppColors.background1,
      onBackground: AppColors.onBackground11,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface1,
    ),
    appBarTheme: AppBarTheme(color: AppColors.primary),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background1,
      brightness: Brightness.dark,
    ),
    backgroundColor: AppColors.background1,
    scaffoldBackgroundColor: AppColors.background1,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.accent1,
      selectionColor: AppColors.accent1,
      selectionHandleColor: AppColors.accent1,
    ),
    indicatorColor: AppColors.accent1,
    textTheme: TextTheme(
      subtitle1: const TextStyle(color: AppColors.inputText, fontSize: 18, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: AppColors.inputHint, fontSize: 18, fontWeight: FontWeight.w400),
    ),
  );
}
