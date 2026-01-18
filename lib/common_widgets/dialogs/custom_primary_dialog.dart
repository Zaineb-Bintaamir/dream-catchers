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
            24.r,
          )),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          surfaceTintColor: AppColors.whiteColor,
          backgroundColor: AppColors.whiteColor ,
          child: Container(
              width: width ?? 0.88.sw,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding ?? 0.05.sw,
                      vertical: 0.04.sh,
                    ),
                    child: screen,
                  ),
                  Positioned(
                      top: -0.1.sw,
                      left: -0.1.sw,
                      child: Container(
                        width: 0.3.sw,
                        height: 0.3.sw,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor.withOpacity(0.4)),
                      )),
                  Positioned(
                      top: -0.08.sw,
                      right: -0.08.sw,
                      child: Container(
                        width: 0.24.sw,
                        height: 0.24.sw,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor.withOpacity(0.4)),
                      )),
                  Positioned(
                      top: 0.018.sh,
                      right: 0.04.sw,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          '',
                          // AppImages.crossIcon,
                          width: 0.065.sw,
                          colorFilter: ColorFilter.mode(
                              AppColors.primaryColor.withOpacity(0.7),
                              BlendMode.srcIn),
                        ),
                      )),
                ],
              )),
        );
      },
    );
  }
}
