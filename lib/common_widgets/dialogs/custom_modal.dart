import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomModal {
  static Future<T?> showCustomModal<T>(BuildContext context, Widget screen,
      {double? heightFactor, Color? backgroundColor}) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          widthFactor: 1,
          // heightFactor: heightFactor ?? 0.75,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: screen,
          ),
        );
      },
    );
  }
}
