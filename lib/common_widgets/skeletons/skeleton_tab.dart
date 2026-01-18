import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonTab extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final bool? isCircle;

  const SkeletonTab(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.isCircle});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.baseColor,
      highlightColor: AppColors.highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.baseColor,
            shape: (isCircle ?? false) ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: (isCircle ?? false)
                ? null
                : BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
