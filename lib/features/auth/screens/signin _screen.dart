import 'package:dream_catchers/common_widgets/buttons/custom_back_button.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/common_widgets/inputs/custom_primary_textfield.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/core/utils/form_validators.dart';
import 'package:dream_catchers/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SigninScreen extends GetView<AuthController> {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.loginFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.05.sw,
              vertical: 0.03.sh,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomBackButton(),
                        SizedBox(height: 0.04.sh),
                        Text(
                          'Sign in',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 0.01.sh),
                        Text(
                          'Enter your email and password to access your account',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 0.04.sh),
                        CustomPrimaryTextField(
                          hintText: 'Enter email address',
                          controller: controller.emailController,
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidators.validateEmail,
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                        SizedBox(height: 0.025.sh),
                        Obx(
                          () => CustomPrimaryTextField(
                            hintText: 'Enter password',
                            controller: controller.passwordController,
                            isPassword: true,
                            showPassword:
                                !controller.isLoginPasswordVisible.value,
                            onTogglePassword:
                                controller.toggleLoginPasswordVisibility,
                            suffixIcon: controller.isLoginPasswordVisible.value
                                ? AppImages.eyeOffIcon
                                : AppImages.eyeIcon,
                            suffixIconSize: 0.06.sw,
                            validator: FormValidators.validatePassword,
                            autovalidateMode: AutovalidateMode.disabled,
                          ),
                        ),
                        SizedBox(height: 0.05.sh),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => CustomButton(
                    text: 'Continue',
                    function: controller.login,
                    isLoading: controller.isLoginLoading.value,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
