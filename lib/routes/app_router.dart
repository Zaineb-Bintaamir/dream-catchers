import 'package:dream_catchers/features/auth/screens/get_started_screen.dart';
import 'package:dream_catchers/features/splash/screens/splash_screen.dart';
import 'package:dream_catchers/routes/app_routes.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(
      name: AppRoutes.getStarted,
      page: () => const GetStartedScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    )
  ];
}
