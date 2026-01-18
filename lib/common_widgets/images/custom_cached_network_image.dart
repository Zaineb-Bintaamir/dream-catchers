import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dream_catchers/common_widgets/images/error_image.dart';
import 'package:dream_catchers/common_widgets/images/skeleton_custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final dynamic image;
  final double width;
  final double height;
  final BoxFit? boxFit;

  const CustomCachedNetworkImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return ErrorImage(width: width, height: height);
    }

    if (image is File) {
      return Image.file(
        image,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.cover,
        errorBuilder: (_, __, ___) => ErrorImage(width: width, height: height),
      );
    }

    if (image is String && image.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: image,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.cover,
        placeholder: (context, url) =>
            SkeletonCustomCachedNetworkImage(width: width, height: height),
        errorWidget: (context, url, error) => ErrorImage(
          width: width,
          height: height,
        ),
      );
    }

    return ErrorImage(width: width, height: height);
  }
}
