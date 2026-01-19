import 'package:dream_catchers/common_widgets/dialogs/custom_snackbar.dart';
import 'package:dream_catchers/core/services/auth_service.dart';
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

  Future<void> login() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      isLoginLoading.value = true;

      try {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        await AuthService.signIn(email: email, password: password);

        Get.offAllNamed(AppRoutes.bottomNavbar);
      } catch (e) {
        final String errorMessage =
            e.toString().contains('Invalid login credentials')
                ? 'Invalid email or password'
                : 'Failed to sign in. Please try again.';

        CustomSnackbar.show(
          status: 'error',
          title: 'Sign In Failed',
          subtitle: errorMessage,
        );
      } finally {
        isLoginLoading.value = false;
      }
    }
  }
}
