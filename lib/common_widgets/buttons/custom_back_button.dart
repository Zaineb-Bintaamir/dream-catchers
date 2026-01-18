import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? arrowColor;
  final String? icon;

  const CustomBackButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.arrowColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 0.1.sw,
          height: 0.1.sw,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.whiteColor,
            border: Border.all(
              color: AppColors.textfieldBorderGrey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.arrowBackIcon,
              colorFilter: arrowColor != null
                  ? ColorFilter.mode(arrowColor!, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
