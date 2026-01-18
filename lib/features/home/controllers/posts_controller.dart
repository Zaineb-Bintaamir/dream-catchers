import 'package:dream_catchers/common_widgets/dialogs/custom_primary_dialog.dart';
import 'package:dream_catchers/core/models/community_model.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/features/home/data/posts.dart';
import 'package:dream_catchers/features/home/widgets/block_confirmation_dialog.dart';
import 'package:dream_catchers/features/home/widgets/post_details_modal.dart';
import 'package:dream_catchers/features/home/widgets/post_options_popup_menu.dart';
import 'package:dream_catchers/features/home/widgets/report_modal.dart';
import 'package:dream_catchers/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class PostsController extends GetxController {
  late final CommunityModel community;
  final RxList<PostModel> posts = <PostModel>[].obs;
  int? _adPosition;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is CommunityModel) {
      community = arguments;
      loadPosts();
      _calculateAdPosition();
    }
  }

//--------------------------------NAVIGATIONS-----------------------------------

  void navigateToCreatePost() {
    Get.toNamed(AppRoutes.createPost, arguments: community);
  }

//-------------------------------MARKETING ADS----------------------------------

  void _calculateAdPosition() {
    if (posts.length > 2) {
      final random = DateTime.now().millisecondsSinceEpoch % (posts.length - 1);
      _adPosition = random + 1;
    }
  }

  int? getAdPosition() {
    return _adPosition;
  }

//------------------------------------POSTS-------------------------------------

  void loadPosts() {
    posts.value = PostsData.getPostsForCommunity(community.id);
  }

  void onLikePost(String postId) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final post = posts[postIndex];
      final updatedPost = PostModel(
        id: post.id,
        userId: post.userId,
        userName: post.userName,
        userAvatar: post.userAvatar,
        timeAgo: post.timeAgo,
        content: post.content,
        likes: post.likes + 1,
        comments: post.comments,
        shares: post.shares,
        dislikes: post.dislikes,
      );
      posts[postIndex] = updatedPost;
    }
  }

  void onDislikePost(String postId) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final post = posts[postIndex];
      final updatedPost = PostModel(
        id: post.id,
        userId: post.userId,
        userName: post.userName,
        userAvatar: post.userAvatar,
        timeAgo: post.timeAgo,
        content: post.content,
        likes: post.likes,
        comments: post.comments,
        shares: post.shares,
        dislikes: post.dislikes + 1,
      );
      posts[postIndex] = updatedPost;
    }
  }

  void onCommentPost(String postId) {}

  void onSharePost(String postId) {
    Get.log('onSharePost: $postId');
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final post = posts[postIndex];
      SharePlus.instance.share(ShareParams(
        text: 'Check out this post by ${post.userName}: ${post.content}',
      ));
    }
  }

//---------------------------------POST FUNCTIONS-------------------------------

  void onPostTap(PostModel post) {
    PostDetailsModal.show(Get.context!, post);
  }

  void showPostOptionsMenu(
      BuildContext context, PostModel post, Offset position) {
    PostOptionsPopupMenu.show(
      context,
      position,
      post,
      onReport: () {
        ReportModal.show(context, post);
      },
      onBlock: () {
        _showBlockDialog(context, post);
      },
    );
  }

  void _showBlockDialog(BuildContext context, PostModel post) {
    CustomPrimaryDialog.showCustomDialog(
      context,
      const BlockConfirmationDialog(),
    );
  }
}
