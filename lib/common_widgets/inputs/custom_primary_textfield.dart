import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPrimaryTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? suffixText;

  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool? readOnly;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final FontStyle? fontStyle;
  final double? suffixIconSize;
  final double? borderRadius;
  final bool? showPassword;
  final VoidCallback? onTogglePassword;
  final VoidCallback? onSuffixClick;

  final double? height;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final String? initialValue;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final Color? borderColor;

  final double? verticalPadding;

  const CustomPrimaryTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.isPassword,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
    this.readOnly,
    this.onTap,
    this.validator,
    this.autovalidateMode,
    this.fontStyle,
    this.suffixIconSize,
    this.showPassword,
    this.onTogglePassword,
    this.borderRadius,
    this.height,
    this.onChange,
    this.onSubmit,
    this.initialValue,
    this.hintStyle,
    this.backgroundColor,
    this.verticalPadding,
    this.borderColor,
    this.suffixText,
    this.onSuffixClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: height != null ? BoxConstraints(minHeight: height!) : null,
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        autovalidateMode: autovalidateMode,
        readOnly: readOnly ?? false,
        onTap: onTap ?? () {},
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        maxLines: maxLines ?? 1,
        inputFormatters: inputFormatters ?? [],
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isPassword ? (showPassword ?? false) : false,
        controller: controller,
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: 14.sp,
          fontFamily: AppFonts.manrope,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.blackColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor ?? AppColors.scaffoldBackgroundColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 0.035.sw, vertical: verticalPadding ?? 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.textfieldBorderGrey,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.textfieldBorderGrey,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.primaryColor,
              width: 1.0,
            ),
          ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  child: SvgPicture.asset(
                    prefixIcon!,
                  ),
                )
              : null,
          prefixIconConstraints: BoxConstraints(
            maxWidth: 0.2.sw,
            maxHeight: 0.2.sw,
          ),
          suffixIconConstraints: BoxConstraints(
            maxWidth: 0.13.sw,
            maxHeight: 0.13.sw,
          ),
          suffixIcon: suffixText != null
              ? Padding(
                  padding: EdgeInsets.only(right: 0.03.sw),
                  child: Text(
                    suffixText ?? '',
                    style: TextStyle(
                      color: AppColors.textfieldHintGreyColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : (suffixIcon != null
                  ? GestureDetector(
                      onTap: isPassword ? onTogglePassword : onSuffixClick,
                      child: Container(
                        color: backgroundColor ??
                            AppColors.scaffoldBackgroundColor,
                        margin: EdgeInsets.only(right: 0.012.sw),
                        padding: EdgeInsets.only(
                            right: 0.03.sw,
                            top: 0.01.sh,
                            bottom: 0.01.sh,
                            left: 0.03.sw),
                        child: SvgPicture.asset(
                          suffixIcon!,
                          width: suffixIconSize,
                          colorFilter: const ColorFilter.mode(
                              AppColors.textfieldHintGreyColor,
                              BlendMode.srcIn),
                        ),
                      ))
                  : null),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                color: AppColors.textfieldHintGreyColor,
                fontSize: 14.sp,
                fontFamily: AppFonts.manrope,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
