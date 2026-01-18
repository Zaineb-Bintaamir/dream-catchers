import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/common_widgets/images/custom_cached_network_image.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/home/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onDislike;
  final bool isPostLiked;
  final bool isPostDisliked;
  final Function(Offset)? onMenuTap;
  final VoidCallback? onPostTap;
  final double? horizontalPadding;
  final double? nameFontSize;
  final double? timeFontSize;
  final double? contentFontSize;
  final bool? showShareButton;
  const PostCard({
    super.key,
    required this.post,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onDislike,
    required this.isPostLiked,
    required this.isPostDisliked,
    this.onMenuTap,
    this.onPostTap,
    this.horizontalPadding,
    this.nameFontSize,
    this.timeFontSize,
    this.contentFontSize,
    this.showShareButton,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onPostTap ?? () {},
      borderRadius: 0.r,
      verticalPadding: 0.014.sh,
      horizontalPadding: horizontalPadding ?? 0.03.sw,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      borderColor: AppColors.scaffoldBackgroundColor,
      showBorder: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: CustomCachedNetworkImage(
                  image: post.userAvatar,
                  width: 0.1.sw,
                  height: 0.1.sw,
                  boxFit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 0.03.sw),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      post.userName,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: nameFontSize ?? 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 0.01.sw,
                      height: 0.01.sw,
                      margin: EdgeInsets.symmetric(horizontal: 0.02.sw),
                      decoration: const BoxDecoration(
                        color: AppColors.textfieldHintGreyColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      post.timeAgo,
                      style: TextStyle(
                        color: AppColors.textfieldHintGreyColor,
                        fontSize: timeFontSize ?? 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (onMenuTap != null) {
                    final RenderBox? renderBox =
                        context.findRenderObject() as RenderBox?;
                    if (renderBox != null) {
                      final Offset position =
                          renderBox.localToGlobal(Offset.zero);
                      final Size size = renderBox.size;
                      onMenuTap!(Offset(
                        position.dx + size.width - 0.05.sw,
                        position.dy + 0.05.sh,
                      ));
                    }
                  }
                },
                child: Container(
                  color: AppColors.scaffoldBackgroundColor,
                  padding: EdgeInsets.only(
                      top: 0.01.sh, bottom: 0.01.sh, left: 0.03.sw),
                  child: SvgPicture.asset(AppImages.horizontalThreeDotsIcon),
                ),
              )
            ],
          ),
          SizedBox(height: 0.015.sh),
          Text(
            post.content,
            style: TextStyle(
              color: AppColors.blackColor.withOpacity(0.8),
              fontSize: contentFontSize ?? 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.02.sh),
          Row(
            children: [
              ActionButton(
                icon: isPostLiked ? AppImages.likedIcon : AppImages.likeIcon,
                count: post.likes,
                onTap: onLike,
              ),
              SizedBox(width: 0.05.sw),
              ActionButton(
                icon: isPostDisliked
                    ? AppImages.dislikedIcon
                    : AppImages.dislikeIcon,
                count: post.dislikes,
                onTap: onDislike,
              ),
              SizedBox(width: 0.05.sw),
              ActionButton(
                icon: AppImages.commentsIcon,
                count: post.comments,
                onTap: onComment,
              ),
              if (showShareButton ?? false) ...[
                const Spacer(),
                ActionButton(
                  icon: AppImages.shareIcon,
                  count: post.shares,
                  onTap: onShare,
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
