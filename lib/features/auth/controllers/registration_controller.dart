import 'package:dream_catchers/common_widgets/dialogs/custom_modal.dart';
import 'package:dream_catchers/common_widgets/dialogs/custom_snackbar.dart';
import 'package:dream_catchers/core/methods/date_handlers.dart';
import 'package:dream_catchers/features/auth/widgets/birthday_modal_content.dart';
import 'package:dream_catchers/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    super.onClose();
  }

//-----------------------------------NAVIGATION---------------------------------

  void navigateBack() {
    Get.back();
  }

  void navigateBackFromHouseRules() {
    _removePreviousRoutesRecursively(routesToRemove: 3);
  }

//-----------------------------------EMAIL--------------------------------------

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final RxBool isEmailLoading = false.obs;

  void continueToNextStep() {
    if (emailFormKey.currentState?.validate() ?? false) {
      isEmailLoading.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        isEmailLoading.value = false;
        Get.toNamed(AppRoutes.signUp);
      });
    }
  }

//-----------------------------------STEPS--------------------------------------

  final RxInt currentStep = 1.obs;
  final int totalSteps = 8;
  double get progress => currentStep.value / totalSteps;
  RxBool isStepButtonEnabled = true.obs;

  void incrementCurrentRegistrationStepIndex() async {
    if (currentStep.value < totalSteps && isStepButtonEnabled.value) {
      isStepButtonEnabled.value = false;
      // scrollController.animateTo(
      //   0,
      //   duration: const Duration(milliseconds: 400),
      //   curve: Curves.easeInOut,
      // );
      // await Future.delayed(const Duration(milliseconds: 600));
      currentStep.value++;
      isStepButtonEnabled.value = true;
    } else if (currentStep.value == totalSteps && isStepButtonEnabled.value) {
      Get.toNamed(AppRoutes.houseRules);
    }
  }

  void decrementCurrentRegistrationStepIndex() async {
    if (currentStep.value > 1 && isStepButtonEnabled.value) {
      isStepButtonEnabled.value = false;

      // scrollController.animateTo(
      //   0,
      //   duration: const Duration(milliseconds: 400),
      //   curve: Curves.easeInOut,
      // );
      // await Future.delayed(const Duration(milliseconds: 600));
      currentStep.value--;
      isStepButtonEnabled.value = true;
    }
  }

  void onManualBackButton() {
    if (currentStep.value == 1) {
      navigateBack();
    } else {
      decrementCurrentRegistrationStepIndex();
    }
  }

//----------------------------------USERNAME------------------------------------

  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();

//----------------------------------GENDER--------------------------------------

  final RxString selectedGender = 'Male'.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void navigateToOthersGender() {
    selectedGender.value = '';
    Get.toNamed(AppRoutes.othersGender);
  }

//---------------------------SEXUAL ORIENTATION---------------------------------

  final RxString selectedSexualOrientation = 'Heterosexual'.obs;

  void selectSexualOrientation(String sexualOrientation) {
    selectedSexualOrientation.value = sexualOrientation;
  }

  void navigateToOthersSexualOrientation() {
    selectedSexualOrientation.value = '';
    Get.toNamed(AppRoutes.othersSexualOrientation);
  }

//----------------------------------BIRTHDAY------------------------------------
  final TextEditingController birthdayController = TextEditingController();
  final Rx<DateTime?> selectedBirthday = Rx<DateTime?>(null);

  void selectBirthday(DateTime date) {
    selectedBirthday.value = date;
  }

  void showDatePicker(BuildContext context) {
    CustomModal.showCustomModal(
        context,
        BirthdayModalContent(
          onDone: () {
            Get.back();
            selectBirthday(selectedBirthday.value ?? DateTime.now());
            birthdayController.text = DateHandlers.formatDate(
                selectedBirthday.value ?? DateTime.now());
          },
          onDateSelected: (date) {
            selectBirthday(date);
          },
        ));
  }

//----------------------------------ETHNICITY------------------------------------

  final RxString selectedEthnicity = ''.obs;

  void selectEthnicity(String ethnicity) {
    selectedEthnicity.value = ethnicity;
  }

//-------------------------------PERSONALITY TYPE--------------------------------

  final RxString selectedPersonalityType = ''.obs;

  void selectPersonalityType(String personalityType) {
    selectedPersonalityType.value = personalityType;
  }

//----------------------------RELATIONSHIP STATUS--------------------------------

  final RxString selectedRelationshipStatus = ''.obs;

  void selectRelationshipStatus(String relationshipStatus) {
    selectedRelationshipStatus.value = relationshipStatus;
  }

//-------------------------------EDUCATION LEVEL--------------------------------

  final RxString selectedEducationLevel = ''.obs;

  void selectEducationLevel(String educationLevel) {
    selectedEducationLevel.value = educationLevel;
  }

//----------------------------------CONTINUE------------------------------------

  void skipStep() {
    switch (currentStep.value) {
      case 6:
        selectedPersonalityType.value = '';
        break;
      case 7:
        selectedRelationshipStatus.value = '';
        break;
      case 8:
        selectedEducationLevel.value = '';
        break;
      default:
        break;
    }
    incrementCurrentRegistrationStepIndex();
  }

  void continueStep() {
    Get.log('currentStep: ${currentStep.value}');
    switch (currentStep.value) {
      case 1:
        if (usernameFormKey.currentState?.validate() ?? false) {
          incrementCurrentRegistrationStepIndex();
        }
        break;
      case 2:
        if (selectedGender.value.isEmpty) {
          CustomSnackbar.show(
              status: 'error',
              title: 'Error',
              subtitle: 'Please select a gender');
          return;
        }
        incrementCurrentRegistrationStepIndex();
        break;
      case 3:
        if (selectedSexualOrientation.value.isEmpty) {
          CustomSnackbar.show(
              status: 'error',
              title: 'Error',
              subtitle: 'Please select a sexual orientation');
          return;
        }
        incrementCurrentRegistrationStepIndex();
        break;
      case 4:
        if (selectedBirthday.value == null) {
          CustomSnackbar.show(
              status: 'error',
              title: 'Error',
              subtitle: 'Please select your birthday');
          return;
        }
        incrementCurrentRegistrationStepIndex();
        break;
      case 5:
        if (selectedEthnicity.value.isEmpty) {
          CustomSnackbar.show(
              status: 'error',
              title: 'Error',
              subtitle: 'Please select your ethnicity');
          return;
        }
        incrementCurrentRegistrationStepIndex();
        break;
      case 6:
        if (selectedPersonalityType.value.isEmpty) {
          CustomSnackbar.show(
              status: 'error',
              title: 'Error',
              subtitle: 'Please select your personality type');
          return;
        }
        incrementCurrentRegistrationStepIndex();
        break;
      case 7:
        if (selectedRelationshipStatus.value.isEmpty) {
          CustomSnackbar.show(
              status: 'error',
              title: 'Error',
              subtitle: 'Please select your relationship status');
          return;
        }
        incrementCurrentRegistrationStepIndex();
        break;
      case 8:
        if (selectedEducationLevel.value.isEmpty) {
          CustomSnackbar.show(
              status: 'error',
              title: 'Error',
              subtitle: 'Please select your education level');
          return;
        }
        incrementCurrentRegistrationStepIndex();
        break;
      default:
        break;
    }
  }

//-------------------------REMOVE MULTIPLE ROUTES-------------------------------

  void _removePreviousRoutesRecursively({int routesToRemove = 5}) {
    if (routesToRemove <= 0) {
      return;
    }

    Get.back();
    _removePreviousRoutesRecursively(routesToRemove: routesToRemove - 1);
  }
}
