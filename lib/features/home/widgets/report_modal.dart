import 'package:dream_catchers/common_widgets/dialogs/custom_modal.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/features/home/controllers/report_controller.dart';
import 'package:dream_catchers/features/home/data/report_categories.dart';
import 'package:dream_catchers/features/home/widgets/report_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportModal {
  static void show(BuildContext context, PostModel post) {
    final ReportController controller = Get.find<ReportController>();
    controller.initialize(post);

    CustomModal.showCustomModal(
      context,
      ReportContent(
        allCategories: ReportCategories.allCategories,
        selectedCategory: controller.selectedCategory,
        onSubmit: controller.onSubmit,
        selectCategory: controller.selectCategory,
      ),
    ).then((_) {
      if (Get.isRegistered<ReportController>()) {
        try {
          Get.delete<ReportController>();
        } catch (e) {
          Get.log(e.toString());
        }
      }
    });
  }
}
