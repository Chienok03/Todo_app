import 'package:flutter/material.dart';
import 'package:todo_app/global/app_color.dart';

class DarkTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.darkPrimaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColor.darkPrimaryColor,
      secondary: AppColor.darkSecondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColor.darkPrimaryColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColor.darkSecondaryColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.darkButtonColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1D1D1D),
      labelStyle:
          TextStyle(color: AppColor.darkSecondaryColor), 
          
    ),
  );
}
