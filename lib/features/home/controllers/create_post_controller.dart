import 'package:dream_catchers/common_widgets/dialogs/custom_snackbar.dart';
import 'package:dream_catchers/core/methods/media_handlers.dart';
import 'package:dream_catchers/core/models/community_model.dart';
import 'package:dream_catchers/core/services/posts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  late final CommunityModel community;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is CommunityModel) {
      community = arguments;
    }
  }

//-----------------------------TITLE/DESCRIPTION--------------------------------

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

//----------------------------------MEDIA---------------------------------------

  final RxList<XFile> selectedMedia = RxList<XFile>();
  final RxBool isLoading = false.obs;

  Future<void> pickImage() async {
    final XFile? image = await MediaHandlers.pickImage();
    if (image != null) {
      selectedMedia.add(image);
    }
  }

  Future<void> pickVideo() async {
    final XFile? video = await MediaHandlers.pickVideo();
    if (video != null) {
      selectedMedia.add(video);
    }
  }

  Future<void> showMediaPicker(BuildContext context) async {
    final XFile? media = await MediaHandlers.showMediaPicker(context);
    if (media != null) {
      selectedMedia.add(media);
    }
  }

  void removeMedia(int index) {
    selectedMedia.removeAt(index);
  }

  String _getMediaTypeFromExtension(String filePath) {
    final String extension = filePath.split('.').last.toLowerCase();

    const List<String> imageExtensions = [
      'jpg',
      'jpeg',
      'png',
      'gif',
      'bmp',
      'webp',
      'svg',
      'heic',
      'heif',
    ];

    const List<String> videoExtensions = [
      'mp4',
      'mov',
      'avi',
      'mkv',
      'webm',
      'flv',
      'wmv',
      'm4v',
      '3gp',
      'mpg',
      'mpeg',
    ];

    if (imageExtensions.contains(extension)) {
      return 'image';
    } else if (videoExtensions.contains(extension)) {
      return 'video';
    } else {
      return 'image';
    }
  }

//------------------------------CREATE POST-------------------------------------

  Future<void> createPost() async {
    final String content = descriptionController.text.trim();
    final String title = titleController.text.trim();
    if (title.isEmpty && content.isEmpty && selectedMedia.isEmpty) {
      CustomSnackbar.show(
        status: 'error',
        title: 'Error',
        subtitle: 'Please add content or media',
      );
      return;
    }

    isLoading.value = true;

    try {
      String? mediaUrl;
      String? mediaType;

      if (selectedMedia.isNotEmpty) {
        final XFile mediaFile = selectedMedia.first;
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${mediaFile.name}';

        mediaType = _getMediaTypeFromExtension(mediaFile.path);

        mediaUrl = await PostsService.uploadMedia(
          filePath: mediaFile.path,
          fileName: fileName,
          mediaType: mediaType,
        );
      }

      await PostsService.createPost(
        content: content.isEmpty ? null : content,
        mediaUrl: mediaUrl,
        title: title.isEmpty ? null : title,
        mediaType: mediaType,
      );
      Get.back();

      CustomSnackbar.show(
        status: 'success',
        title: 'Success',
        subtitle: 'Post created successfully',
      );
    } catch (e) {
      Get.log('Error creating post: $e');
      CustomSnackbar.show(
        status: 'error',
        title: 'Error',
        subtitle: 'Failed to create post. Please try again.',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
