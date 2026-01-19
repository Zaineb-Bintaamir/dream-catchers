import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostDescription extends StatelessWidget {
  final String description;
  const PostDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0.01.sh),
      child: CustomContainer(
        borderRadius: 5.r,
        borderColor: AppColors.primaryColor.withOpacity(0.05),
        showBorder: false,
        horizontalPadding: 0.02.sw,
        verticalPadding: 0.012.sh,
        backgroundColor: AppColors.primaryColor.withOpacity(0.05),
        onTap: () {},
        child: Row(
          children: [
            SvgPicture.asset(AppImages.infoCircleIcon),
            SizedBox(width: 0.02.sw),
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
