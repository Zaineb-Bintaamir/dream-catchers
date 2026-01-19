import 'package:flutter/material.dart';

class AppColors {
//------------------------------DESIGN COLORS-----------------------------------

  static LinearGradient primaryGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [darkBlueColor, darkBlueColor, lightBlueColor]);

  static const Color scaffoldBackgroundColor = whiteColor;

  static const Color primaryColor = Color(0xFF3693E9);
  static const Color darkBlueColor = Color(0xFF2D92D3);
  static const Color lightBlueColor = Color(0xFF44CBF1);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFF7A7A7A);
  static const Color textfieldBorderGrey = Color(0xFFE3E3E3);
  static const Color textfieldHintGreyColor = Color(0xFFB3B3B3);
  static const Color darkGreyColor = Color(0xFF4E4E4E);

  static const Color progressIndicatorInactiveColor = Color(0xFFECECEC);
  static const Color redColor = Color(0xFFFF0000);
  static const Color navbarInactiveGreyColor = Color(0xFFBEBEBE);
  static const Color communityCardGreyColor = Color(0xFFF2F2F2);
  static const Color marketingAdGreyColor = Color(0xFFEDEDED);
  static const Color commentCardGreyColor = Color(0xFFF8F8F8);

//---------------------------SKELETON COLORS------------------------------------

  static final baseColor = Colors.grey.shade300;
  static final highlightColor = Colors.grey.shade100;
}
