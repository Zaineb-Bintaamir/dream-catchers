import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarIcon extends StatelessWidget {
  const NavbarIcon({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: AppColors.scaffoldBackgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  scale: isSelected ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: SvgPicture.asset(
                    icon,
                    width: 0.07.sw,
                    height: 0.07.sw,
                    colorFilter: ColorFilter.mode(
                        isSelected
                            ? AppColors.primaryColor
                            : AppColors.navbarInactiveGreyColor,
                        BlendMode.srcIn),
                  ),
                ),
                SizedBox(height: 0.01.sh),
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.navbarInactiveGreyColor,
                    fontSize: 12.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Text(title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
