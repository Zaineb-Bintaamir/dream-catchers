import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WriteSomething extends StatelessWidget {
  final VoidCallback onTap;
  const WriteSomething({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      borderRadius: 8.r,
      verticalPadding: 0.016.sh,
      horizontalPadding: 0.04.sw,
      backgroundColor: AppColors.whiteColor,
      borderColor: AppColors.textfieldBorderGrey,
      marginBottom: 0.025.sh,
      showBorder: false,
      child: Row(
        children: [
          SvgPicture.asset(AppImages.addFilledIcon),
          SizedBox(width: 0.03.sw),
          Text(
            'Write something...',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
