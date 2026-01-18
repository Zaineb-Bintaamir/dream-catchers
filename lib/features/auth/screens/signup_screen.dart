import 'package:dream_catchers/common_widgets/appbars/custom_appbar.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/common_widgets/progress_indicators/custom_progress_indicator.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/features/auth/controllers/registration_controller.dart';
import 'package:dream_catchers/features/auth/widgets/birthday_step_widget.dart';
import 'package:dream_catchers/features/auth/widgets/education_level_step_widget.dart';
import 'package:dream_catchers/features/auth/widgets/ethnicity_step_widget.dart';
import 'package:dream_catchers/features/auth/widgets/gender_step_widget.dart';
import 'package:dream_catchers/features/auth/widgets/personality_type_step_widget.dart';
import 'package:dream_catchers/features/auth/widgets/relationship_status_step_widget.dart';
import 'package:dream_catchers/features/auth/widgets/sexual_orientation_step_widget.dart';
import 'package:dream_catchers/features/auth/widgets/signup_bottom_text.dart';
import 'package:dream_catchers/features/auth/widgets/username_step_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<RegistrationController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: controller.currentStep.value == 1 ? true : false,
        onPopInvoked: (popDisposition) {
          if (controller.currentStep.value == 1) {
            return;
          }
          controller.onManualBackButton();
        },
        child: Scaffold(
          appBar: CustomAppbar(
            title: 'Sign Up',
            onBackButton: () => controller.onManualBackButton(),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.05.sw,
                vertical: 0.03.sh,
              ),
              child: Column(
                children: [
                  CustomLinearIndicator(
                    progress: controller.progress,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 0.03.sh),
                      child: Obx(() {
                        switch (controller.currentStep.value) {
                          case 1:
                            return UsernameStepWidget(
                              usernameFormKey: controller.usernameFormKey,
                              usernameController: controller.usernameController,
                            );
                          case 2:
                            return GenderStepWidget(
                              selectedGender: controller.selectedGender,
                              onSelectGender: controller.selectGender,
                              onSelectOthers: controller.navigateToOthersGender,
                              isOthersSelected:
                                  (controller.selectedGender.value.isNotEmpty &&
                                      !(controller.selectedGender.value ==
                                          "Male") &&
                                      !(controller.selectedGender.value ==
                                          "Female")),
                            );
                          case 3:
                            return SexualOrientationStepWidget(
                              selectedSexualOrientation:
                                  controller.selectedSexualOrientation,
                              onSelectSexualOrientation:
                                  controller.selectSexualOrientation,
                              onSelectOthers:
                                  controller.navigateToOthersSexualOrientation,
                              isOthersSelected: (controller
                                      .selectedSexualOrientation
                                      .value
                                      .isNotEmpty &&
                                  !(controller
                                          .selectedSexualOrientation.value ==
                                      "Heterosexual") &&
                                  !(controller
                                          .selectedSexualOrientation.value ==
                                      "Homosexual")),
                            );
                          case 4:
                            return BirthdayStepWidget(
                              selectedDate: controller.selectedBirthday,
                              onDateSelected: controller.selectBirthday,
                              controller: controller.birthdayController,
                              onOpenDatePicker: () {},
                              onShowDatePicker: () =>
                                  controller.showDatePicker(context),
                            );
                          case 5:
                            return EthnicityStepWidget(
                              selectedEthnicity: controller.selectedEthnicity,
                              onSelectEthnicity: controller.selectEthnicity,
                            );
                          case 6:
                            return PersonalityTypeStepWidget(
                              selectedPersonalityType:
                                  controller.selectedPersonalityType,
                              onSelectPersonalityType:
                                  controller.selectPersonalityType,
                            );
                          case 7:
                            return RelationshipStatusStepWidget(
                              selectedRelationshipStatus:
                                  controller.selectedRelationshipStatus,
                              onSelectRelationshipStatus:
                                  controller.selectRelationshipStatus,
                            );
                          case 8:
                            return EducationLevelStepWidget(
                              selectedEducationLevel:
                                  controller.selectedEducationLevel,
                              onSelectEducationLevel:
                                  controller.selectEducationLevel,
                            );
                          default:
                            return Container();
                        }
                      }),
                    ),
                  ),
                  controller.currentStep.value == 1
                      ? const SignupBottomText(
                          text: 'This will be shown on your profile. Username ',
                          boldText: 'cannot be changed.')
                      : controller.currentStep.value == 4
                          ? const SignupBottomText(
                              text:
                                  'Your age will be used as a filter for matching. Your profile will show your age, not your date of birth. ',
                              boldText: 'This cannot be changed later.')
                          : controller.currentStep.value == 6
                              ? const SignupBottomText(
                                  text:
                                      'The personality type used follows the 16 Personalities. It will be used as a filter for more accurate matching.',
                                  boldText: '')
                              : controller.currentStep.value == 7
                                  ? const SignupBottomText(
                                      text:
                                          'Your relationship status will be used as a filter for more accurate matching.',
                                      boldText: '')
                                  : controller.currentStep.value == 8
                                      ? const SignupBottomText(
                                          text:
                                              'Your education level will be used as filter for more accurate matching.',
                                          boldText: '')
                                      : const SizedBox(),
                  CustomButton(
                    text: 'Continue',
                    function: controller.continueStep,
                    isLoading: false,
                    width: double.infinity,
                  ),
                  if (controller.currentStep.value == 6 ||
                      controller.currentStep.value == 7 ||
                      controller.currentStep.value == 8)
                    Padding(
                      padding: EdgeInsets.only(top: 0.004.sh),
                      child: TextButton(
                        onPressed: controller.skipStep,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
