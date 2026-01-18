import 'package:dream_catchers/common_widgets/dialogs/custom_modal.dart';
import 'package:dream_catchers/features/home/controllers/post_details_controller.dart';
import 'package:dream_catchers/features/home/widgets/view_all_comments_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllCommentsModal {
  static void show(BuildContext context) {
    final PostDetailsController controller = Get.find<PostDetailsController>();

    CustomModal.showCustomModal(
      context,
      ViewAllCommentsContent(
        comments: controller.comments,
        onLikeComment: (commentId) => controller.onLikeComment(commentId),
        onDislikeComment: (commentId) => controller.onDislikeComment(commentId),
      ),
    );
  }
}
