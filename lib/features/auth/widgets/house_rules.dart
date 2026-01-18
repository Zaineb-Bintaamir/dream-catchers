import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HouseRule extends StatelessWidget {
  final String title;
  final String description;
  final String? boldText;
  final String? descriptionAfter;
  const HouseRule({
    super.key,
    required this.title,
    required this.description,
    this.boldText,
    this.descriptionAfter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 0.008.sh),
        Text.rich(
          TextSpan(
            text: description,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            children: boldText != null
                ? [
                    TextSpan(
                      text: boldText,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (descriptionAfter != null)
                      TextSpan(
                        text: descriptionAfter,
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ]
                : descriptionAfter != null
                    ? [
                        TextSpan(
                          text: descriptionAfter,
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]
                    : null,
          ),
        ),
        SizedBox(height: 0.03.sh),
      ],
    );
  }
}
