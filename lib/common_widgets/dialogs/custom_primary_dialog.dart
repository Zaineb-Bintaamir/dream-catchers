import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomPrimaryDialog {
  static void showCustomDialog(BuildContext context, Widget screen,
      {double? horizontalPadding, double? width, bool? barrierDismissible}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            20.r,
          )),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          surfaceTintColor: AppColors.whiteColor,
          backgroundColor: AppColors.whiteColor,
          child: Container(
              width: width ?? 0.85.sw,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 0.05.sw,
                  vertical: 0.04.sh,
                ),
                child: screen,
              )),
        );
      },
    );
  }
}
