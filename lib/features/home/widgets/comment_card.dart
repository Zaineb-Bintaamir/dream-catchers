import 'package:dream_catchers/common_widgets/cards/custom_container.dart';
import 'package:dream_catchers/common_widgets/images/custom_cached_network_image.dart';
import 'package:dream_catchers/core/models/comment_model.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/home/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentCard extends StatelessWidget {
  final CommentModel comment;
  final VoidCallback onLike;
  final VoidCallback onDislike;
  final List<BoxShadow>? shadows;
  final Color? backgroundColor;

  const CommentCard({
    super.key,
    required this.comment,
    required this.onLike,
    required this.onDislike,
    this.shadows,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: () {},
      backgroundColor: backgroundColor ?? AppColors.commentCardGreyColor,
      borderRadius: 10.r,
      horizontalPadding: 0.03.sw,
      verticalPadding: 0.015.sh,
      marginBottom: 0.01.sh,
      showBorder: false,
      shadows: shadows,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: CustomCachedNetworkImage(
                  image: comment.userAvatar,
                  width: 0.08.sw,
                  height: 0.08.sw,
                  boxFit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 0.03.sw),
              Text(
                comment.userName ?? 'Anonymous',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
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
                comment.timeAgo ?? 'just now',
                style: TextStyle(
                  color: AppColors.textfieldHintGreyColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppImages.horizontalThreeDotsIcon),
            ],
          ),
          SizedBox(height: 0.01.sh),
          Text(
            comment.content,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.015.sh),
          Row(
            children: [
              Text(
                'Reply',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              ActionButton(
                icon: AppImages.likeIcon,
                count: 0,
                onTap: onLike,
              ),
              SizedBox(width: 0.05.sw),
              ActionButton(
                icon: AppImages.dislikeIcon,
                count: 0,
                onTap: onDislike,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
