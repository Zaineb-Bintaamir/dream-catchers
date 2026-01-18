import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void show(
      {required String status,
      required String title,
      required String subtitle}) {
    Get.snackbar(
      '',
      '',
      titleText: const SizedBox.shrink(),
      messageText: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border(
            left: BorderSide(
                width: 4,
                color: status == 'success'
                    ? const Color(0xFF4E8D7C)
                    : status == 'error'
                        ? const Color(0xFFAC3333)
                        : status == 'warning'
                            ? const Color(0xFFFC8621)
                            : AppColors.primaryColor),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 0.08.sw,
              height: 0.08.sw,
              decoration: BoxDecoration(
                color: status == 'success'
                    ? const Color(0xFF4E8D7C)
                    : status == 'error'
                        ? const Color(0xFFAC3333)
                        : status == 'warning'
                            ? const Color(0xFFFC8621)
                            : AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  status == 'success'
                      ? ''
                      // AppImages.checkIcon
                      : status == 'error'
                          ? ''
                          // AppImages.crossIcon
                          : status == 'warning'
                              ? ''
                              // AppImages.infoIcon1
                              : '',
                  // AppImages.infoIcon2
                  width: status == 'success'
                      ? 0.03.sw
                      : status == 'error'
                          ? 0.05.sw
                          : status == 'warning'
                              ? 0.006.sw
                              : 0.006.sw,
                  colorFilter: const ColorFilter.mode(
                    AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: 0.03.sw),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500)),
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(left: 0.04.sw, right: 0.04.sw, bottom: 0.015.sh),
      padding: EdgeInsets.zero,
      borderRadius: 0,
    );
  }
}
