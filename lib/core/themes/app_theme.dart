import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: AppFonts.manrope,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.whiteColor,
      position: PopupMenuPosition.under,
      surfaceTintColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
            topRight: Radius.zero),
      ),
    ),
  );
}
