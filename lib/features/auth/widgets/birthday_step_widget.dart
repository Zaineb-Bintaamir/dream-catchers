import 'package:dream_catchers/common_widgets/inputs/custom_primary_textfield.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BirthdayStepWidget extends StatelessWidget {
  final Rx<DateTime?> selectedDate;
  final Function(DateTime) onDateSelected;
  final VoidCallback onOpenDatePicker;
  final VoidCallback onShowDatePicker;
  final TextEditingController controller;
  const BirthdayStepWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.onOpenDatePicker,
    required this.onShowDatePicker,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SignupHeading(heading: "When's your birthday?"),
                CustomPrimaryTextField(
                  hintText: 'Select date',
                  controller: controller,
                  isPassword: false,
                  readOnly: true,
                  prefixIcon: AppImages.calendarIcon,
                  onTap: onShowDatePicker,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
