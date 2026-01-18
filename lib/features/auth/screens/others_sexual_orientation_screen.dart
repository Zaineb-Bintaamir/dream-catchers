import 'package:dream_catchers/common_widgets/appbars/custom_appbar.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/features/auth/controllers/registration_controller.dart';
import 'package:dream_catchers/features/auth/data/sexual_orientations.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:dream_catchers/features/auth/widgets/signup_select_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OthersSexualOrientationScreen extends GetView<RegistrationController> {
  const OthersSexualOrientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Sign Up'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.03.sh,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SignupHeading(heading: 'Others'),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            SexualOrientations.allSexualOrientations.length - 2,
                        itemBuilder: (context, index) {
                          final String sexualOrientation = SexualOrientations
                              .allSexualOrientations[index + 2];
                          return Obx(
                            () => SignupSelectOptionWidget(
                              text: sexualOrientation,
                              isSelected:
                                  controller.selectedSexualOrientation.value ==
                                      sexualOrientation,
                              onSelect: () => controller
                                  .selectSexualOrientation(sexualOrientation),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Continue',
                function: controller.navigateBack,
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
