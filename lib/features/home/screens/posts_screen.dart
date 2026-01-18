import 'package:dream_catchers/common_widgets/appbars/custom_appbar.dart';
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
            final int? adPosition = controller.getAdPosition();
            final int totalItems =
                controller.posts.length + 2 + (adPosition != null ? 1 : 0);

            return ListView.builder(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
              itemCount: totalItems,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return PostDescription(
                      description: controller.community.description);
                }
                if (index == 1) {
                  return WriteSomething(onTap: controller.navigateToCreatePost);
                }

                int postIndex = index - 2;
                if (adPosition != null && postIndex == adPosition) {
                  return const MarketingAd();
                }
                if (adPosition != null && postIndex > adPosition) {
                  postIndex = postIndex - 1;
                }

                final PostModel post = controller.posts[postIndex];
                return PostCard(
                  post: post,
                  onLike: () => controller.onLikePost(post.id),
                  onComment: () => controller.onCommentPost(post.id),
                  onShare: () => controller.onSharePost(post.id),
                  onDislike: () => controller.onDislikePost(post.id),
                  isPostLiked: false,
                  isPostDisliked: false,
                  onPostTap: () => controller.onPostTap(post),
                  onMenuTap: (position) =>
                      controller.showPostOptionsMenu(context, post, position),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
