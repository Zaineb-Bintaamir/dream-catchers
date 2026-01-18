import 'package:dream_catchers/common_widgets/dialogs/custom_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MediaHandlers {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<XFile?> pickImage({int imageQuality = 80}) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
      );
      return image;
    } catch (e) {
      Get.log('Error picking image: $e');

      return null;
    }
  }

  static Future<XFile?> pickVideo() async {
    try {
      final XFile? video = await _imagePicker.pickVideo(
        source: ImageSource.gallery,
      );
      return video;
    } catch (e) {
      Get.log('Error picking video: $e');

      return null;
    }
  }

  static Future<XFile?> showMediaPicker(BuildContext context) async {
    return await CustomModal.showCustomModal<XFile?>(
      context,
      SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pick Image'),
              onTap: () async {
                final image = await pickImage();
                if (image != null) {
                  Get.back(result: image);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Pick Video'),
              onTap: () async {
                final video = await pickVideo();
                if (video != null) {
                  Get.back(result: video);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
