import 'package:dream_catchers/common_widgets/buttons/custom_back_button.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onBackButton;

  const CustomAppbar({
    super.key,
    this.title,
    this.actions,
    this.onBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        toolbarHeight: 0.09.sh,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        surfaceTintColor: AppColors.scaffoldBackgroundColor,
        shadowColor: AppColors.scaffoldBackgroundColor,
        elevation: 1,
        leading: Container(
          margin: EdgeInsets.only(left: 0.05.sw),
          child: CustomBackButton(
            onTap: onBackButton,
          ),
        ),
        centerTitle: true,
        title: title != null
            ? Text(
                title!,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.09.sh);
}
