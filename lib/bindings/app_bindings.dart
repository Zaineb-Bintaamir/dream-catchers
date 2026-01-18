import 'package:dream_catchers/features/auth/controllers/auth_controller.dart';
import 'package:dream_catchers/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(TokenController(), permanent: true);
    // Get.put(NotificationNavigationController(), permanent: true);

    // Get.put(ApiService(), permanent: true);
    // Get.put(LocalStorage(), permanent: true);
    // Get.put(LocalDatabase(), permanent: true);

    // Get.put(SseService(), permanent: true);

    // Get.put(StudentProfileController(), permanent: true);
    // Get.put(StudentProfileRepository(), permanent: true);
    // Get.put(AppconfigController(), permanent: true);

    Get.put(SplashController());

    // Get.lazyPut(() => AuthRepository());

    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
