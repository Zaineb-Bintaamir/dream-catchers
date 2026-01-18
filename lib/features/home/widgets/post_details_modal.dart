import 'package:dream_catchers/common_widgets/dialogs/custom_modal.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/features/home/controllers/post_details_controller.dart';
import 'package:dream_catchers/features/home/widgets/post_details_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailsModal {
  static void show(BuildContext context, PostModel post) {
    final PostDetailsController controller = Get.find<PostDetailsController>();
    controller.initialize(post);

    CustomModal.showCustomModal(
      context,
      PostDetailsContent(
        post: controller.post,
        comments: controller.comments,
        commentController: controller.commentController,
        onViewAllComments: () => controller.onViewAllComments(),
        onLikePost: () => controller.onLikePost(),
        onDislikePost: () => controller.onDislikePost(),
        onComment: () {},
        onAddComment: () => controller.addComment(),
        onShare: () =>
            controller.postsController.onSharePost(controller.post.id),
        isPostLiked: controller.isPostLiked,
        isPostDisliked: controller.isPostDisliked,
        onLikeComment: (commentId) => controller.onLikeComment(commentId),
        onDislikeComment: (commentId) => controller.onDislikeComment(commentId),
        onMenuTap: (position) => controller.postsController
            .showPostOptionsMenu(context, controller.post, position),
      ),
    ).then((_) {
      if (Get.isRegistered<PostDetailsController>()) {
        try {
          Get.delete<PostDetailsController>();
        } catch (e) {
          Get.log(e.toString());
        }
      }
    });
  }
}
