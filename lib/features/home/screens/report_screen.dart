import 'package:dream_catchers/common_widgets/appbars/custom_appbar.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/features/home/controllers/post_details_controller.dart';
import 'package:dream_catchers/features/home/data/report_categories.dart';
import 'package:dream_catchers/features/home/widgets/report_category_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportScreen extends GetView<PostDetailsController> {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Report An Issue',
        onBackButton: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thanks for looking out for yourself and your fellow users by reporting things that break the rules. Let us know what\'s happening, and we\'ll look into it.',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 0.03.sh),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.03.sw,
                    mainAxisSpacing: 0.02.sh,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: ReportCategories.allCategories.length,
                  itemBuilder: (context, index) {
                    final category = ReportCategories.allCategories[index];
                    return Obx(
                      () => ReportCategoryItem(
                        category: category,
                        isSelected: 'Spam' == category,
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 0.02.sh),
              Text.rich(
                TextSpan(
                  text: 'You can also contact us at ',
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'askus@companyemail.com',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.02.sh),
              CustomButton(
                text: 'Submit',
                function: () {},
                isLoading: false,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
