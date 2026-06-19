import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    // textTheme: TextTheme(
    //   displayLarge: AppFonts.body1,
    //   displayMedium: AppFonts.body2,
    //   bodyLarge: AppFonts.button1,
    //   bodyMedium: AppFonts.button2,
    //   headlineLarge: AppFonts.heading1,
    //   headlineMedium: AppFonts.heading1Reg,
    //   headlineSmall: AppFonts.heading2,
    // ),
    colorScheme: .fromSeed(
      background: AppColors.background,
      seedColor: Colors.transparent,
      primary: AppColors.primary,
    ).copyWith(brightness: Brightness.light),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      selectedIconTheme: IconThemeData(color: AppColors.activeColor),
      elevation: 10,
    ).copyWith(backgroundColor: AppColors.background),
    buttonTheme: ButtonThemeData(buttonColor: AppColors.activeColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: AppColors.primary,
    ),
    // textTheme: TextTheme(
    //   headlineLarge: AppFonts.heading1Reg,
    //   titleLarge: AppFonts.shopNamelogin,
    // ),
  );
}
