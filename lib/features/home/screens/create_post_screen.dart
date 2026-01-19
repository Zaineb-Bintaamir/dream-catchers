import 'package:dream_catchers/common_widgets/appbars/custom_appbar.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/common_widgets/inputs/custom_primary_textfield.dart';
import 'package:dream_catchers/features/home/controllers/create_post_controller.dart';
import 'package:dream_catchers/features/home/widgets/media_upload_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreatePostScreen extends GetView<CreatePostController> {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Create A Post'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sh),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryTextField(
                        hintText: 'Title',
                        controller: controller.titleController,
                        isPassword: false,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 0.02.sh),
                      CustomPrimaryTextField(
                        hintText: 'Description...',
                        controller: controller.descriptionController,
                        isPassword: false,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        verticalPadding: 0.02.sh,
                      ),
                      SizedBox(height: 0.04.sh),
                      MediaUploadWidget(
                        mediaFiles: controller.selectedMedia,
                        onTap: () => controller.showMediaPicker(context),
                        onRemove: (index) => controller.removeMedia(index),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => CustomButton(
                  text: 'Post',
                  function: controller.createPost,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
