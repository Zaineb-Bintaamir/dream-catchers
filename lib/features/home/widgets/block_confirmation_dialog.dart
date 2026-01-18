import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BlockConfirmationDialog extends StatelessWidget {
  const BlockConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 0.24.sw,
          height: 0.24.sw,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.crossIcon,
            ),
          ),
        ),
        SizedBox(height: 0.03.sh),
        Text(
          'Are you sure?',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 0.01.sh),
        Text(
          "You won't see posts or comments from this user.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 0.04.sh),
        SizedBox(
          height: 0.055.sh,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Cancel',
                  function: () => Get.back(),
                  isLoading: false,
                  backgroundColor: AppColors.whiteColor,
                  fontSize: 14.sp,
                  textColor: AppColors.greyColor,
                  borderColor: AppColors.textfieldBorderGrey,
                ),
              ),
              SizedBox(width: 0.03.sw),
              Expanded(
                child: CustomButton(
                  text: 'Block',
                  function: () => Get.back(),
                  isLoading: false,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
