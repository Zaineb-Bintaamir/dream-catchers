import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBottomText extends StatelessWidget {
  final String text;
  final String? boldText;
  const SignupBottomText({super.key, required this.text, this.boldText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.02.sh, left: 0.03.sw, right: 0.03.sw),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: text,
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: boldText ?? '',
              style: TextStyle(
                color: AppColors.redColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
