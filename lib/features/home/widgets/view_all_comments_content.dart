import 'package:dream_catchers/core/models/comment_model.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/features/home/widgets/comment_card.dart';
import 'package:dream_catchers/features/home/widgets/modal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewAllCommentsContent extends StatelessWidget {
  final List<CommentModel> comments;
  final Function(String) onLikeComment;
  final Function(String) onDislikeComment;

  const ViewAllCommentsContent({
    super.key,
    required this.comments,
    required this.onLikeComment,
    required this.onDislikeComment,
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
              const ModalAppbar(title: 'View All Comments'),
              SizedBox(height: 0.02.sh),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.sw,
                      vertical: 0.02.sh,
                    ),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final CommentModel comment = comments[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 0.02.sh),
                        child: CommentCard(
                          comment: comment,
                          shadows: const [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 20,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            )
                          ],
                          backgroundColor: AppColors.whiteColor,
                          onLike: () => onLikeComment(comment.id),
                          onDislike: () => onDislikeComment(comment.id),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
