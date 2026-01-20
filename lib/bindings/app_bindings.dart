import 'package:dream_catchers/features/auth/controllers/auth_controller.dart';
import 'package:dream_catchers/features/auth/controllers/registration_controller.dart';
import 'package:dream_catchers/features/bottom_navbar/controllers/bottom_navbar_controller.dart';
import 'package:dream_catchers/features/home/controllers/create_post_controller.dart';
import 'package:dream_catchers/features/home/controllers/home_controller.dart';
import 'package:dream_catchers/features/home/controllers/post_details_controller.dart';
import 'package:dream_catchers/features/home/controllers/posts_controller.dart';
import 'package:dream_catchers/features/home/controllers/report_controller.dart';
import 'package:dream_catchers/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => RegistrationController(), fenix: true);
    Get.lazyPut(() => BottomNavbarController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => PostsController(), fenix: true);
    Get.lazyPut(() => PostDetailsController(), fenix: true);
    Get.lazyPut(() => ReportController(), fenix: true);
    Get.lazyPut(() => CreatePostController(), fenix: true);
  }
}
