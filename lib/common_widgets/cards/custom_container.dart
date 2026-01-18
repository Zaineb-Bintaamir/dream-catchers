import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? showBorder;
  final List<BoxShadow>? shadows;
  const CustomContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    required this.onTap,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.showBorder,
    this.borderColor,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 0.02.sh,
              horizontal: horizontalPadding ?? 0.05.sw),
          margin: EdgeInsets.only(bottom: 0.015.sh),
          decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.whiteColor,
              border: Border.all(
                  width: 1,
                  color: (showBorder ?? true)
                      ? AppColors.blackColor.withOpacity(0.08)
                      : (borderColor ??
                          backgroundColor ??
                          AppColors.whiteColor)),
              borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
              boxShadow: shadows),
          child: child),
    );
  }
}
