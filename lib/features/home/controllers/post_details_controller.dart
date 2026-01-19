import 'package:dream_catchers/common_widgets/dialogs/custom_snackbar.dart';
import 'package:dream_catchers/core/models/comment_model.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/core/services/comments_service.dart';
import 'package:dream_catchers/core/services/posts_service.dart';
import 'package:dream_catchers/features/home/controllers/posts_controller.dart';
import 'package:dream_catchers/features/home/widgets/view_all_comments_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailsController extends GetxController {
  final PostsController postsController = Get.find<PostsController>();

//-------------------------------POST DETAILS-----------------------------------

  late PostModel post;
  final RxList<CommentModel> comments = <CommentModel>[].obs;
  final RxBool isPostLiked = false.obs;
  final RxBool isLoadingComments = false.obs;
  final RxBool isLoadingMoreComments = false.obs;
  final TextEditingController commentController = TextEditingController();

  int _currentCommentPage = 0;
  bool _hasMoreComments = true;

  void initialize(PostModel postData) {
    post = postData;
    isPostLiked.value = post.isLiked ?? false;
    loadComments();
  }

  Future<void> loadComments({bool refresh = false}) async {
    if (refresh) {
      _currentCommentPage = 0;
      _hasMoreComments = true;
      comments.clear();
    }

    if (!_hasMoreComments || isLoadingComments.value) {
      return;
    }

    isLoadingComments.value = true;

    try {
      final List<CommentModel> newComments = await CommentsService.getComments(
        postId: post.id,
        page: _currentCommentPage,
      );

      if (refresh) {
        comments.value = newComments;
      } else {
        comments.addAll(newComments);
      }

      if (newComments.length < 20) {
        _hasMoreComments = false;
      } else {
        _currentCommentPage++;
      }
    } catch (e) {
      Get.log('Error loading comments: $e');
    } finally {
      isLoadingComments.value = false;
    }
  }

  Future<void> loadMoreComments() async {
    if (isLoadingMoreComments.value || !_hasMoreComments) {
      return;
    }

    isLoadingMoreComments.value = true;

    try {
      final List<CommentModel> newComments = await CommentsService.getComments(
        postId: post.id,
        page: _currentCommentPage,
      );

      comments.addAll(newComments);

      if (newComments.length < 20) {
        _hasMoreComments = false;
      } else {
        _currentCommentPage++;
      }
    } catch (e) {
      Get.log('Error loading more comments: $e');
    } finally {
      isLoadingMoreComments.value = false;
    }
  }

  Future<void> onLikePost() async {
    try {
      await PostsService.likePost(post.id);
      isPostLiked.value = !isPostLiked.value;

      await postsController.refreshPosts();
    } catch (e) {
      Get.log('Error liking post: $e');
      CustomSnackbar.show(
        status: 'error',
        title: 'Error',
        subtitle: 'Failed to like post. Please try again.',
      );
    }
  }

  void onViewAllComments() {
    ViewAllCommentsModal.show(Get.context!);
  }

  Future<void> addComment() async {
    final String content = commentController.text.trim();
    if (content.isEmpty) {
      return;
    }

    try {
      final CommentModel newComment = await CommentsService.createComment(
        postId: post.id,
        content: content,
      );

      comments.insert(0, newComment);
      commentController.clear();

      await postsController.refreshPosts();
    } catch (e) {
      Get.log('Error adding comment: $e');
      CustomSnackbar.show(
        status: 'error',
        title: 'Error',
        subtitle: 'Failed to add comment. Please try again.',
      );
    }
  }
}
