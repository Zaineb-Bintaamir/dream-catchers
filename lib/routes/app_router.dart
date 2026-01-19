import 'package:dream_catchers/features/auth/screens/email_screen.dart';
import 'package:dream_catchers/features/auth/screens/get_started_screen.dart';
import 'package:dream_catchers/features/auth/screens/house_rules_screen.dart';
import 'package:dream_catchers/features/auth/screens/others_gender_screen.dart';
import 'package:dream_catchers/features/auth/screens/others_sexual_orientation_screen.dart';
import 'package:dream_catchers/features/auth/screens/signin%20_screen.dart';
import 'package:dream_catchers/features/auth/screens/signup_screen.dart';
import 'package:dream_catchers/features/bottom_navbar/screens/bottom_navbar_screen.dart';
import 'package:dream_catchers/features/home/screens/create_post_screen.dart';
import 'package:dream_catchers/features/home/screens/posts_screen.dart';
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
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SigninScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.email,
      page: () => const EmailScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.othersGender,
      page: () => const OthersGenderScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.othersSexualOrientation,
      page: () => const OthersSexualOrientationScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.houseRules,
      page: () => const HouseRulesScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.bottomNavbar,
      page: () => const BottomNavbarScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.posts,
      page: () => const PostsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.createPost,
      page: () => const CreatePostScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
