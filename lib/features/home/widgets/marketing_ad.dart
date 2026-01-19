import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketingAd extends StatelessWidget {
  const MarketingAd({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: () {},
      borderRadius: 8.r,
      verticalPadding: 0.06.sh,
      horizontalPadding: 0.05.sw,
      backgroundColor: AppColors.marketingAdGreyColor,
      borderColor: AppColors.marketingAdGreyColor,
      showBorder: false,
      child: Center(
        child: Text(
          'Marketing Ad',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
