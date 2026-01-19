import 'dart:io';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MediaUploadWidget extends StatelessWidget {
  final RxList<XFile> mediaFiles;
  final VoidCallback onTap;
  final Function(int) onRemove;

  const MediaUploadWidget({
    super.key,
    required this.mediaFiles,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (mediaFiles.isEmpty)
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: onTap,
                child: DottedBorder(
                  color: AppColors.primaryColor,
                  strokeWidth: 1,
                  dashPattern: const [8, 4],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10.r),
                  child: Container(
                    width: 0.8.sw,
                    padding: EdgeInsets.symmetric(vertical: 0.016.sh),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      '+ Add photos and videos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            )
          else
            Wrap(
              spacing: 0.02.sw,
              runSpacing: 0.02.sh,
              children: [
                ...mediaFiles.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final XFile file = entry.value;
                  final bool isVideo =
                      file.path.toLowerCase().endsWith('.mp4') ||
                          file.path.toLowerCase().endsWith('.mov') ||
                          file.path.toLowerCase().endsWith('.avi');

                  return Stack(
                    children: [
                      Container(
                        width: 0.27.sw,
                        height: 0.27.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: isVideo
                              ? Container(
                                  color: AppColors.greyColor.withOpacity(0.3),
                                  child: const Center(
                                    child: Icon(
                                      Icons.play_circle_filled,
                                      color: AppColors.primaryColor,
                                      size: 40,
                                    ),
                                  ),
                                )
                              : Image.file(
                                  File(file.path),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: AppColors.greyColor,
                                      child: const Icon(Icons.image),
                                    );
                                  },
                                ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () => onRemove(index),
                          child: Container(
                            padding: EdgeInsets.all(0.01.sw),
                            decoration: const BoxDecoration(
                              color: AppColors.redColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: AppColors.whiteColor,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                GestureDetector(
                  onTap: onTap,
                  child: DottedBorder(
                    color: AppColors.primaryColor,
                    strokeWidth: 1,
                    dashPattern: const [8, 4],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10.r),
                    child: Container(
                      width: 0.27.sw,
                      height: 0.27.sw,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.addFilledIcon,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
