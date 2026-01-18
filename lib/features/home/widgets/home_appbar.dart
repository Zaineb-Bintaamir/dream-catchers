import 'package:dream_catchers/common_widgets/inputs/custom_primary_textfield.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Function(String) onSearchChanged;
  const HomeAppbar({
    super.key,
    required this.height,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        toolbarHeight: height,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        surfaceTintColor: AppColors.scaffoldBackgroundColor,
        shadowColor: AppColors.scaffoldBackgroundColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          height: height,
          padding: EdgeInsets.symmetric(vertical: 0.02.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Discover ',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Communities',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              CustomPrimaryTextField(
                hintText: 'Search for advice...',
                isPassword: false,
                prefixIcon: AppImages.searchIcon,
                onChange: onSearchChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
