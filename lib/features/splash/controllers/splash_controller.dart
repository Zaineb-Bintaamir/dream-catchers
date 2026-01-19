import 'package:dream_catchers/core/services/auth_service.dart';
import 'package:dream_catchers/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkAuthStateAndNavigate();
  }

  Future<void> _checkAuthStateAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    if (AuthService.isAuthenticated) {
      Get.offAllNamed(AppRoutes.bottomNavbar);
    } else {
      Get.offAllNamed(AppRoutes.getStarted);
    }
  }
}
