import 'package:dream_catchers/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

//------------------------------NAVIGATIONS-------------------------------------
  void navigateToSignUp() {
    Get.toNamed(AppRoutes.email);
  }

  void navigateToSignIn() {
    Get.toNamed(AppRoutes.signIn);
  }

  void navigateToPrivacyPolicy() {}

  void navigateToTermsOfService() {}

//--------------------------------SIGN IN---------------------------------------

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final RxBool isLoginPasswordVisible = false.obs;
  final RxBool isLoginLoading = false.obs;

  void toggleLoginPasswordVisibility() {
    isLoginPasswordVisible.value = !isLoginPasswordVisible.value;
  }

  void login() {
    if (loginFormKey.currentState?.validate() ?? false) {
      isLoginLoading.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        isLoginLoading.value = false;
        Get.toNamed(AppRoutes.bottomNavbar);
      });
    }
  }
}
