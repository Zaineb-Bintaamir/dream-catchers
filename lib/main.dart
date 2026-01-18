import 'package:dream_catchers/bindings/app_bindings.dart';
import 'package:dream_catchers/core/themes/app_theme.dart';
import 'package:dream_catchers/core/utils/app_constants.dart';
import 'package:dream_catchers/routes/app_router.dart';
import 'package:dream_catchers/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            initialBinding: AppBindings(),
            scrollBehavior: const MaterialScrollBehavior()
                .copyWith(physics: const BouncingScrollPhysics()),
            getPages: AppRouter.routes,
            initialRoute: AppRoutes.splash,
            title: AppConstants.appName,
            defaultTransition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 300),
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: child!,
              );
            },
          );
        });
  }
}
