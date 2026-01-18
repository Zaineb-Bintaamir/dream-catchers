import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearIndicator extends StatelessWidget {
  final double progress;
  final Color? progressColor;
  final Color? backgroundColor;

  const CustomLinearIndicator({
    super.key,
    required this.progress,
    this.progressColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: 0.01.sh,
          child: Stack(
            children: [
              Container(
                height: 0.01.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor ??
                      AppColors.progressIndicatorInactiveColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                height: 0.01.sh,
                width: progress * constraints.maxWidth,
                decoration: BoxDecoration(
                  color: progressColor ?? AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
