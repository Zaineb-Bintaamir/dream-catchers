import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  final double width;
  final double height;

  const ErrorImage({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: AppColors.baseColor,
      child: const Icon(Icons.broken_image, color: AppColors.greyColor),
    );
  }
}
