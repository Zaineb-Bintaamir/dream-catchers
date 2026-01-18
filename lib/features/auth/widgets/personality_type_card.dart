import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalityTypeCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onSelect;
  final Widget? suffix;
  final Color? textColor;

  const PersonalityTypeCard({
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
      borderRadius: 7.r,
      verticalPadding: 0.02.sh,
      horizontalPadding: 0.03.sw,
      backgroundColor: AppColors.whiteColor,
      showBorder: false,
      borderColor:
          isSelected ? AppColors.primaryColor : AppColors.textfieldBorderGrey,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.textfieldHintGreyColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
