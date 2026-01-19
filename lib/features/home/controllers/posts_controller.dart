import 'package:dream_catchers/common_widgets/dialogs/custom_primary_dialog.dart';
import 'package:dream_catchers/common_widgets/dialogs/custom_snackbar.dart';
import 'package:dream_catchers/core/models/community_model.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/core/services/posts_service.dart';
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
  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  int _currentPage = 0;
  bool _hasMorePosts = true;
  int? _adPosition;

  bool get hasMorePosts => _hasMorePosts;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is CommunityModel) {
      community = arguments;
      loadPosts();
    }
  }

//--------------------------------NAVIGATIONS-----------------------------------

  void navigateToCreatePost() {
    Get.toNamed(AppRoutes.createPost, arguments: community)?.then((_) {
      refreshPosts();
    });
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

  Future<void> loadPosts({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      _hasMorePosts = true;
      posts.clear();
    }

    if (!_hasMorePosts || isLoading.value) {
      return;
    }

    isLoading.value = true;

    try {
      final List<PostModel> newPosts =
          await PostsService.getPosts(page: _currentPage, sortBy: 'trending');

      if (refresh) {
        posts.value = newPosts;
      } else {
        posts.addAll(newPosts);
      }

      if (newPosts.length < 3) {
        _hasMorePosts = false;
      } else {
        _currentPage++;
      }

      _calculateAdPosition();
    } catch (e) {
      Get.log('Error loading posts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMorePosts() async {
    if (isLoadingMore.value || !_hasMorePosts) {
      return;
    }

    isLoadingMore.value = true;

    try {
      final List<PostModel> newPosts =
          await PostsService.getPosts(page: _currentPage, sortBy: 'trending');

      posts.addAll(newPosts);

      if (newPosts.length < 3) {
        _hasMorePosts = false;
      } else {
        _currentPage++;
      }
    } catch (e) {
      Get.log('Error loading more posts: $e');
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> refreshPosts() async {
    await loadPosts(refresh: true);
  }

  Future<void> onLikePost(String postId) async {
    try {
      await PostsService.likePost(postId);

      final postIndex = posts.indexWhere((post) => post.id == postId);
      if (postIndex != -1) {
        await refreshPosts();
      }
    } catch (e) {
      Get.log('Error liking post: $e');
      CustomSnackbar.show(
        status: 'error',
        title: 'Error',
        subtitle: 'Failed to like post. Please try again.',
      );
    }
  }

  Future<void> onSharePost(String postId) async {
    try {
      final postIndex = posts.indexWhere((post) => post.id == postId);
      if (postIndex != -1) {
        final post = posts[postIndex];

        await PostsService.sharePost(postId);

        await SharePlus.instance.share(
          ShareParams(text: post.content ?? 'Check out this post!'),
        );

        await refreshPosts();
      }
    } catch (e) {
      Get.log('Error sharing post: $e');
      final postIndex = posts.indexWhere((post) => post.id == postId);
      if (postIndex != -1) {
        final post = posts[postIndex];
        await SharePlus.instance.share(
          ShareParams(text: post.content ?? 'Check out this post!'),
        );
      }
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
