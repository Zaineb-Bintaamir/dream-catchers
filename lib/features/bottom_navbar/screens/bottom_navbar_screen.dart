import "package:dream_catchers/core/themes/app_colors.dart";
import "package:dream_catchers/features/bottom_navbar/controllers/bottom_navbar_controller.dart";
import "package:dream_catchers/features/bottom_navbar/widgets/navbar_icon.dart";
import "package:dream_catchers/features/home/widgets/home_appbar.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class BottomNavbarScreen extends GetView<BottomNavbarController> {
  const BottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => PopScope(
          canPop: controller.currentIndex.value == 0 ? true : false,
          onPopInvoked: controller.onPopInvoked,
          child: Scaffold(
            appBar: controller.currentIndex.value == 0
                ? HomeAppbar(
                    height: 0.16.sh,
                    onSearchChanged: controller.homeController.onSearchChanged,
                  )
                : null,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              behavior: HitTestBehavior.opaque,
              child: SafeArea(
                child: IndexedStack(
                  index: controller.currentIndex.value,
                  children: List.generate(
                    controller.titles.length,
                    (index) =>
                        controller.screensCache[index] ?? const SizedBox(),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
                height: 0.1.sh,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 20,
                      offset: Offset(0, -3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(controller.titles.length, (index) {
                      return NavbarIcon(
                        onTap: () => controller.selectIndex(index),
                        isSelected: controller.currentIndex.value == index,
                        icon: controller.icons[index],
                        title: controller.titles[index],
                      );
                    })),
              ),
            ),
          ),
        ));
  }
}
