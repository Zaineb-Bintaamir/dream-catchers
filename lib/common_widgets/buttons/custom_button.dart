import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final Color? borderColor;
  final Color? backgroundColor;
  final String text;
  final Color? textColor;
  final VoidCallback? function;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final bool? disabled;
  final bool isLoading;
  final String? prefixIcon;
  final double? prefixIconSize;
  final String? suffixIcon;
  final double? suffixIconSize;
  final FontWeight? fontWeight;
  final double? loaderWidth;
  final double? strokeWidth;

  const CustomButton({
    super.key,
    this.borderColor,
    this.backgroundColor,
    required this.text,
    this.function,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.disabled,
    required this.isLoading,
    this.prefixIcon,
    this.fontWeight,
    this.prefixIconSize,
    this.suffixIcon,
    this.suffixIconSize,
    this.loaderWidth,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (isLoading) ? null : function,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: width ?? double.infinity,
        height: height ?? 0.06.sh,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
            width: 1.0,
          ),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: loaderWidth ?? 20.sp,
                  height: loaderWidth ?? 20.sp,
                  child: CircularProgressIndicator(
                    strokeWidth: strokeWidth ?? 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        textColor ?? AppColors.whiteColor),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) ...[
                      SvgPicture.asset(
                        prefixIcon!,
                        colorFilter: ColorFilter.mode(
                            textColor ?? AppColors.whiteColor, BlendMode.srcIn),
                        width: prefixIconSize ?? 0.05.sw,
                      ),
                      SizedBox(width: 0.02.sw),
                    ],
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor ?? AppColors.whiteColor,
                        fontSize: fontSize ?? 16.sp,
                        fontWeight: fontWeight ?? FontWeight.w500,
                      ),
                    ),
                    if (suffixIcon != null) ...[
                      SizedBox(width: 0.02.sw),
                      SvgPicture.asset(
                        suffixIcon!,
                        colorFilter: ColorFilter.mode(
                            textColor ?? AppColors.whiteColor, BlendMode.srcIn),
                        width: suffixIconSize ?? 0.025.sw,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
