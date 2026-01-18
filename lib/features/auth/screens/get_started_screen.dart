import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/auth/controllers/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GetStartedScreen extends GetView<AuthController> {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -0.75.sw,
            child: Container(
              width: 2.sw,
              height: 2.sw,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0.4.sw,
            child: Image.asset(AppImages.splashLogoImage, width: 0.75.sw),
          ),
          Positioned(
            bottom: 0.04.sh,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.08.sw),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Anytime, Anywhere, Anyone',
                      style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.04.sh),
                    CustomButton(
                      text: 'Sign up',
                      function: controller.navigateToSignUp,
                      isLoading: false,
                    ),
                    SizedBox(height: 0.03.sh),
                    GestureDetector(
                      onTap: controller.navigateToSignIn,
                      child: Text.rich(
                        TextSpan(
                          text: 'Already joined? ',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 0.03.sh),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Tapping "Sign up" Or "Sign in" means you understand and accept Ask Asap\'s ',
                          style: TextStyle(
                            color: AppColors.darkGreyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.navigateToPrivacyPolicy,
                            ),
                            TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: AppColors.darkGreyColor)),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.navigateToTermsOfService,
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
