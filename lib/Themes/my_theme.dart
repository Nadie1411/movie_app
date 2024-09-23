import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Themes/app_colors.dart';

class MyTheme {
  static ThemeData theme = ThemeData(
      textTheme: TextTheme(
    headlineLarge: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    headlineMedium: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
    headlineSmall: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
    bodyLarge: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 24,
    ),
    bodyMedium: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
    bodySmall: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 8,
    ),
    displayLarge: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
  ));
}
