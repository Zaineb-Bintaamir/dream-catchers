import 'package:dream_catchers/core/models/community_model.dart';
import 'package:dream_catchers/features/home/data/communities.dart';
import 'package:dream_catchers/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<CommunityModel> communities = Communities.allCommunities.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCommunities();
  }

//---------------------------------COMMUNITIES----------------------------------

  void loadCommunities() {
    communities.assignAll(Communities.allCommunities);
  }

  void onCommunityTap(CommunityModel community) {
    Get.toNamed(AppRoutes.posts, arguments: community);
  }

//-----------------------------------SEARCH-------------------------------------
  void onSearchChanged(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      communities.value = Communities.allCommunities;
    } else {
      communities.value = Communities.allCommunities
          .where((community) =>
              community.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
