import 'package:dream_catchers/common_widgets/appbars/custom_appbar.dart';
import 'package:dream_catchers/common_widgets/progress_indicators/custom_circular_progress_indicator.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/features/home/controllers/posts_controller.dart';
import 'package:dream_catchers/features/home/widgets/marketing_ad.dart';
import 'package:dream_catchers/features/home/widgets/post_card.dart';
import 'package:dream_catchers/features/home/widgets/post_description.dart';
import 'package:dream_catchers/features/home/widgets/write_something.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostsScreen extends GetView<PostsController> {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: controller.community.name),
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value && controller.posts.isEmpty) {
              return const Center(
                child: CustomCircularProgressIndicator(),
              );
            }

            final int? adPosition = controller.getAdPosition();
            final int postsLength = controller.posts.length;

            int totalItems = 2;
            if (adPosition != null && postsLength > 0) {
              totalItems += 1;
            }
            totalItems += postsLength;

            if (postsLength == 0 && !controller.isLoading.value) {
              return Column(
                children: [
                  PostDescription(
                    description: controller.community.description,
                  ),
                  WriteSomething(onTap: controller.navigateToCreatePost),
                  Expanded(
                    child: Center(
                      child: Text(
                        'No posts yet. Be the first to post!',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels >=
                        scrollInfo.metrics.maxScrollExtent - 200 &&
                    !controller.isLoadingMore.value &&
                    controller.hasMorePosts &&
                    !controller.isLoading.value) {
                  controller.loadMorePosts();
                }
                return false;
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.02.sh),
                itemCount:
                    totalItems + (controller.isLoadingMore.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return PostDescription(
                        description: controller.community.description);
                  }
                  if (index == 1) {
                    return WriteSomething(
                        onTap: controller.navigateToCreatePost);
                  }

                  int postIndex = index - 2;

                  if (adPosition != null && postsLength > 0) {
                    if (postIndex == adPosition) {
                      return const MarketingAd();
                    }
                    if (postIndex > adPosition) {
                      postIndex = postIndex - 1;
                    }
                  }

                  if (postIndex < 0 || postIndex >= postsLength) {
                    return const SizedBox.shrink();
                  }

                  if (index == totalItems) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                      child: const Center(
                        child: CustomCircularProgressIndicator(),
                      ),
                    );
                  }

                  final PostModel post = controller.posts[postIndex];
                  return PostCard(
                    post: post,
                    onLike: () => controller.onLikePost(post.id),
                    onComment: () => {},
                    onShare: () => controller.onSharePost(post.id),
                    onDislike: () => {},
                    isPostLiked: post.isLiked ?? false,
                    isPostDisliked: false,
                    onPostTap: () => controller.onPostTap(post),
                    onMenuTap: (position) =>
                        controller.showPostOptionsMenu(context, post, position),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
