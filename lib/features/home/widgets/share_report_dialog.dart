import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/common_widgets/inputs/custom_primary_textfield.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareReportDialog extends StatelessWidget {
  final TextEditingController reportController;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const ShareReportDialog({
    super.key,
    required this.reportController,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 0.2.sw,
          height: 0.2.sw,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.shareReportIcon,
            ),
          ),
        ),
        SizedBox(height: 0.02.sh),
        Text(
          'Share Report',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 0.015.sh),
        CustomPrimaryTextField(
          hintText: 'Report what happened...',
          controller: reportController,
          isPassword: false,
          keyboardType: TextInputType.multiline,
          verticalPadding: 0.02.sh,
          maxLines: 4,
          borderRadius: 10.r,
          backgroundColor: AppColors.whiteColor,
          borderColor: AppColors.textfieldBorderGrey,
        ),
        SizedBox(height: 0.03.sh),
        SizedBox(
          height: 0.055.sh,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Cancel',
                  function: onCancel,
                  isLoading: false,
                  fontSize: 14.sp,
                  backgroundColor: AppColors.whiteColor,
                  textColor: AppColors.greyColor,
                  borderColor: AppColors.textfieldBorderGrey,
                ),
              ),
              SizedBox(width: 0.03.sw),
              Expanded(
                child: CustomButton(
                  text: 'Submit',
                  fontSize: 14.sp,
                  function: onSubmit,
                  isLoading: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
