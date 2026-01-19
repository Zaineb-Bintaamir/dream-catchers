import 'package:dream_catchers/common_widgets/buttons/custom_back_button.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/common_widgets/inputs/custom_primary_textfield.dart';
import 'package:dream_catchers/common_widgets/progress_indicators/custom_circular_progress_indicator.dart';
import 'package:dream_catchers/core/models/comment_model.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/home/widgets/comment_card.dart';
import 'package:dream_catchers/features/home/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostDetailsContent extends StatelessWidget {
  final PostModel post;
  final List<CommentModel> comments;
  final TextEditingController commentController;
  final RxBool isLoadingComments;
  final VoidCallback onViewAllComments;
  final VoidCallback onLikePost;
  final VoidCallback onComment;
  final VoidCallback onAddComment;
  final VoidCallback onShare;
  final RxBool isPostLiked;
  final Function(Offset) onMenuTap;

  const PostDetailsContent({
    super.key,
    required this.post,
    required this.comments,
    required this.commentController,
    required this.isLoadingComments,
    required this.onViewAllComments,
    required this.onLikePost,
    required this.onComment,
    required this.onAddComment,
    required this.onShare,
    required this.isPostLiked,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 0.9.sh,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBackButton(),
                      SizedBox(height: 0.02.sh),
                      Obx(
                        () => PostCard(
                          post: post,
                          onLike: onLikePost,
                          onDislike: () {},
                          onComment: () {},
                          isPostLiked: isPostLiked.value,
                          isPostDisliked: false,
                          onMenuTap: (position) => onMenuTap(position),
                          horizontalPadding: 0,
                          nameFontSize: 18.sp,
                          timeFontSize: 14.sp,
                          contentFontSize: 14.sp,
                          showShareButton: true,
                          onShare: onShare,
                          showBoxShadow: false,
                        ),
                      ),
                      SizedBox(height: 0.01.sh),
                      Text(
                        'Comments',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 0.015.sh),
                      Obx(
                        () {
                          if (isLoadingComments.value && comments.isEmpty) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 0.02.sh, bottom: 0.03.sh),
                                child: SizedBox(
                                    width: 20.sp,
                                    height: 20.sp,
                                    child:
                                        const CustomCircularProgressIndicator()),
                              ),
                            );
                          }

                          final int commentsToShow =
                              comments.length > 2 ? 2 : comments.length;

                          if (commentsToShow == 0) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 0.02.sh, bottom: 0.03.sh),
                                child: Text(
                                  'No comments yet. Be the first to comment!',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: commentsToShow,
                            itemBuilder: (context, index) {
                              final CommentModel comment = comments[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 0.005.sh),
                                child: CommentCard(
                                  comment: comment,
                                  onLike: () {},
                                  onDislike: () {},
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.01.sh),
              Row(
                children: [
                  Expanded(
                    child: CustomPrimaryTextField(
                      hintText: 'Write a comment...',
                      controller: commentController,
                      isPassword: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      borderRadius: 20.r,
                    ),
                  ),
                  SizedBox(width: 0.02.sw),
                  GestureDetector(
                    onTap: onAddComment,
                    child: Container(
                      width: 0.12.sw,
                      height: 0.12.sw,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.commentsIcon,
                          colorFilter: const ColorFilter.mode(
                            AppColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => (comments.length > 2)
                  ? Column(children: [
                      SizedBox(height: 0.01.sh),
                      CustomButton(
                        text: 'View all comments',
                        function: onViewAllComments,
                        isLoading: false,
                        width: double.infinity,
                      ),
                    ])
                  : const SizedBox.shrink())
            ],
          ),
        ),
      ),
    );
  }
}
