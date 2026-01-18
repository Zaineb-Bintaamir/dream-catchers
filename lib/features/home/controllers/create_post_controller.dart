import 'package:dream_catchers/common_widgets/dialogs/custom_snackbar.dart';
import 'package:dream_catchers/core/methods/media_handlers.dart';
import 'package:dream_catchers/core/models/community_model.dart';
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

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
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

//------------------------------CREATE POST-------------------------------------

  Future<void> createPost() async {
    if (titleController.text.trim().isEmpty &&
        descriptionController.text.trim().isEmpty &&
        selectedMedia.isEmpty) {
      CustomSnackbar.show(
        status: 'error',
        title: 'Error',
        subtitle: 'Please fill in title, description or media',
      );
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    } catch (e) {
      Get.log('Error creating post: $e');
      CustomSnackbar.show(
        status: 'error',
        title: 'Error',
        subtitle: 'Failed to create post',
      );
    } finally {
      isLoading.value = false;
    }
  }
}
