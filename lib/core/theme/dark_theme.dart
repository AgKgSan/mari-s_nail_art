import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: .fromSeed(
      seedColor: AppColors.primary,
    ).copyWith(brightness: Brightness.dark),
  );
}
