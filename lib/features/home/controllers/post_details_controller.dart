import 'package:dream_catchers/core/models/comment_model.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/features/home/controllers/posts_controller.dart';
import 'package:dream_catchers/features/home/data/comments.dart';
import 'package:dream_catchers/features/home/widgets/view_all_comments_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailsController extends GetxController {
  final PostsController postsController = Get.find<PostsController>();

//-------------------------------POST DETAILS-----------------------------------

  late final PostModel post;
  final RxList<CommentModel> comments = <CommentModel>[].obs;
  final RxBool isPostLiked = false.obs;
  final RxBool isPostDisliked = false.obs;
  final TextEditingController commentController = TextEditingController();

  void initialize(PostModel postData) {
    post = postData;
    loadComments();
  }

  void loadComments() {
    comments.value = CommentsData.getCommentsForPost(post.id);
  }

  void onLikePost() {
    isPostLiked.value = !isPostLiked.value;
    if (isPostDisliked.value) {
      isPostDisliked.value = false;
    }
  }

  void onDislikePost() {
    isPostDisliked.value = !isPostDisliked.value;
    if (isPostLiked.value) {
      isPostLiked.value = false;
    }
  }
//-----------------------------------COMMENTS-----------------------------------

  void onLikeComment(String commentId) {
    final commentIndex =
        comments.indexWhere((comment) => comment.id == commentId);
    if (commentIndex != -1) {
      final comment = comments[commentIndex];
      final updatedComment = CommentModel(
        id: comment.id,
        userId: comment.userId,
        userName: comment.userName,
        userAvatar: comment.userAvatar,
        timeAgo: comment.timeAgo,
        content: comment.content,
        likes: comment.likes + 1,
        dislikes: comment.dislikes,
      );
      comments[commentIndex] = updatedComment;
    }
  }

  void onDislikeComment(String commentId) {
    final commentIndex =
        comments.indexWhere((comment) => comment.id == commentId);
    if (commentIndex != -1) {
      final comment = comments[commentIndex];
      final updatedComment = CommentModel(
        id: comment.id,
        userId: comment.userId,
        userName: comment.userName,
        userAvatar: comment.userAvatar,
        timeAgo: comment.timeAgo,
        content: comment.content,
        likes: comment.likes,
        dislikes: comment.dislikes + 1,
      );
      comments[commentIndex] = updatedComment;
    }
  }

  void onViewAllComments() {
    ViewAllCommentsModal.show(Get.context!);
  }

  void addComment() {
    final String content = commentController.text.trim();
    if (content.isEmpty) {
      return;
    }

    final CommentModel newComment = CommentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'current_user',
      userName: 'You',
      userAvatar: 'https://i.pravatar.cc/150?img=3',
      timeAgo: 'now',
      content: content,
      likes: 0,
      dislikes: 0,
    );

    comments.insert(0, newComment);
    commentController.clear();
  }

  void onReplyComment(String commentId) {}
}
