import 'package:dream_catchers/common_widgets/buttons/custom_back_button.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/features/home/data/report_categories.dart';
import 'package:dream_catchers/features/home/widgets/modal_appbar.dart';
import 'package:dream_catchers/features/home/widgets/report_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportContent extends StatelessWidget {
  final List<String> allCategories;
  final Rx<String> selectedCategory;
  final VoidCallback onSubmit;
  final Function(String) selectCategory;

  const ReportContent({
    super.key,
    required this.allCategories,
    required this.selectedCategory,
    required this.onSubmit,
    required this.selectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 0.9.sh,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ModalAppbar(title: 'Report An Issue'),
              SizedBox(height: 0.02.sh),
              Text(
                'Thanks for looking out for yourself and your fellow users by reporting things that break the rules. Let us know what\'s happening, and we\'ll look into it.',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 0.03.sh),
              Expanded(
                  child: Wrap(
                spacing: 0.02.sw,
                runSpacing: 0.01.sh,
                children: List.generate(
                  allCategories.length,
                  (index) => Obx(
                    () => ReportCategoryItem(
                        category: allCategories[index],
                        isSelected: selectedCategory.value ==
                            ReportCategories.allCategories[index],
                        onTap: () => selectCategory(allCategories[index])),
                  ),
                ),
              )),
              SizedBox(height: 0.02.sh),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
                child: Text.rich(
                  TextSpan(
                    text: 'You can also contact us at ',
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'askus@companyemail.com',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 0.02.sh),
              CustomButton(
                text: 'Submit',
                function: onSubmit,
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
