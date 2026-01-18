import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportCategoryItem extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const ReportCategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      borderRadius: 100.r,
      verticalPadding: 0.01.sh,
      horizontalPadding: 0.04.sw,
      marginBottom: 0.sh,
      backgroundColor:
          isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      borderColor:
          isSelected ? AppColors.primaryColor : AppColors.textfieldBorderGrey,
      showBorder: false,
      child: Text(
        category,
        style: TextStyle(
          color: isSelected
              ? AppColors.whiteColor
              : AppColors.textfieldHintGreyColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
