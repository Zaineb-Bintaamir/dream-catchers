import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/home/controllers/home_controller.dart';
import 'package:dream_catchers/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  final HomeController homeController = Get.find();

  @override
  void onInit() async {
    super.onInit();
    selectIndex(0);
  }
//------------------------------NAVIGATIONS-------------------------------------

  void navigateBack() {
    Get.back();
  }
//-----------------------------BOTTOM TABS--------------------------------------

  RxInt currentIndex = 0.obs;

  final screensCache = <int, Widget>{};

  Widget getScreen(int index) {
    if (!screensCache.containsKey(index)) {
      screensCache[index] = _buildScreen(index);
    }
    return screensCache[index]!;
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
      default:
        return const SizedBox();
    }
  }

  List<String> icons = [
    AppImages.homeNavbarIcon,
    AppImages.askAdvisorNavbarIcon,
    AppImages.chatsNavbarIcon,
    AppImages.profileNavbarIcon,
  ];

  List<String> titles = [
    'Home',
    'Ask Advisor',
    'Chats',
    'Profile',
  ];

  void selectIndex(int index) {
    currentIndex.value = index;
    getScreen(index);
  }

//----------------------------ON POP INVOKED------------------------------------

  void onPopInvoked(bool popDisposition) {
    if (currentIndex.value == 0) {
      return;
    }
    currentIndex.value = 0;
  }
}
