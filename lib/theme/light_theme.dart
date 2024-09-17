import 'package:flutter/material.dart';
import 'package:todo_app/global/app_color.dart';

class LightTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.lightPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColor.lightPrimaryColor,
      secondary: AppColor.lightSecondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColor.lightPrimaryColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColor.lightSecondaryColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.lightButtonColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColor.lightTextFieldColor,
      labelStyle: TextStyle(color: AppColor.lightSecondaryColor),
    ),
  );
}
