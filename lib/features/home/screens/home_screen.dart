import 'package:dream_catchers/core/models/community_model.dart';
import 'package:dream_catchers/features/home/controllers/home_controller.dart';
import 'package:dream_catchers/features/home/widgets/community_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.03.sw,
            mainAxisSpacing: 0.02.sh,
            childAspectRatio: 0.9,
          ),
          itemCount: controller.communities.length,
          itemBuilder: (context, index) {
            final CommunityModel community = controller.communities[index];
            return CommunityCard(
              name: community.name,
              image: community.image,
              onTap: () => controller.onCommunityTap(community),
            );
          },
        );
      },
    );
  }
}
