import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostOptionsPopupMenu {
  static void show(BuildContext context, Offset position, PostModel post,
      {required VoidCallback onReport, required VoidCallback onBlock}) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        MediaQuery.of(context).size.width - position.dx,
        MediaQuery.of(context).size.height - position.dy,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      color: AppColors.whiteColor,
      elevation: 1,
      items: <PopupMenuEntry<void>>[
        PopupMenuItem<void>(
          height: 0.04.sh,
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.sh),
          child: Text(
            'Report',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Future.delayed(const Duration(milliseconds: 100), () {
              onReport();
            });
          },
        ),
        PopupMenuItem<void>(
          height: 0.04.sh,
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.sh),
          child: Text(
            'Block Account',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Future.delayed(const Duration(milliseconds: 100), () {
              onBlock();
            });
          },
        ),
      ],
    );
  }
}
