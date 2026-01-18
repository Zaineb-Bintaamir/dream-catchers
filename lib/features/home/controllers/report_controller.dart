import 'package:dream_catchers/common_widgets/dialogs/custom_primary_dialog.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/features/home/widgets/share_report_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  late final PostModel post;
  final RxString selectedCategory = ''.obs;
  final TextEditingController reportTextController = TextEditingController();

  @override
  void onClose() {
    reportTextController.dispose();
    super.onClose();
  }

  void initialize(PostModel postData) {
    post = postData;
  }

  void selectCategory(String category) {
    if (category == 'Others') {
      _showShareReportDialog();
    } else {
      selectedCategory.value = category;
    }
  }

  void _showShareReportDialog() {
    CustomPrimaryDialog.showCustomDialog(
      Get.context!,
      ShareReportDialog(
        reportController: reportTextController,
        onCancel: () {
          Get.back();
        },
        onSubmit: () {
          Get.back();
        },
      ),
    );
  }

  void onSubmit() {
    if (selectedCategory.value.isEmpty) {
      return;
    }
    Navigator.pop(Get.context!);
  }
}
