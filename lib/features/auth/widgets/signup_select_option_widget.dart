import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSelectOptionWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onSelect;
  final Widget? suffix;
  final Color? textColor;

  const SignupSelectOptionWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onSelect,
    this.suffix,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onSelect,
      borderRadius: 5.r,
      verticalPadding: 0.016.sh,
      backgroundColor:
          isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      borderColor:
          isSelected ? AppColors.primaryColor : AppColors.textfieldBorderGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.whiteColor
                  : textColor ?? AppColors.textfieldHintGreyColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}
