import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';

class AppFonts {
  static TextStyle get shopNamelogin => GoogleFonts.fredoka(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static TextStyle get heading1Reg =>
      GoogleFonts.fredoka(fontSize: 28, fontWeight: FontWeight.normal);
  static TextStyle get heading2 =>
      GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle get heading2Reg =>
      GoogleFonts.fredoka(fontSize: 20, fontWeight: FontWeight.normal);
  static TextStyle get body1 => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
  );
  static TextStyle get body2 =>
      GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle get button1 => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
  );
  static TextStyle get button2 => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
  );
  static TextStyle get text =>
      GoogleFonts.fredoka(fontSize: 12, fontWeight: FontWeight.w300);
  static TextStyle get text2 => GoogleFonts.fredoka(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    color: AppColors.secondary,
  );
  static TextStyle get hintText => GoogleFonts.fredoka(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.text2,
  );
  static TextStyle get loginText => GoogleFonts.fredoka(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle get greeting => GoogleFonts.fredoka(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
}
