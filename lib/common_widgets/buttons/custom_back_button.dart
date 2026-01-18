import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
          width: 0.13.sw,
          height: 0.13.sw,
          decoration: BoxDecoration(
              color: backgroundColor ??
                  AppColors.textfieldBorderGrey.withOpacity(0.04),
              shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              AppImages.backArrowIcon,
              // icon ?? AppImages.backArrowIcon,
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
