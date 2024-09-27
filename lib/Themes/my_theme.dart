import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class MyTheme {
  static ThemeData theme = ThemeData(
      textTheme: TextTheme(
    headlineLarge: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 18.spMin,
    ),
    headlineMedium: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 15.spMin,
    ),
    headlineSmall: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 10.sp,
    ),
    bodyLarge: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 24.spMax,
    ),
    bodyMedium: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 15.sp,
    ),
    bodySmall: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 8.sp,
    ),
    displayLarge: GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 20.sp,
    ),
  ));
}
