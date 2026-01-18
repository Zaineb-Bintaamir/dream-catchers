import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonCustomCachedNetworkImage extends StatelessWidget {
  final double width;
  final double height;

  const SkeletonCustomCachedNetworkImage({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.baseColor,
      highlightColor: AppColors.highlightColor,
      child: Container(
        width: width,
        height: height,
        color: AppColors.greyColor,
      ),
    );
  }
}
