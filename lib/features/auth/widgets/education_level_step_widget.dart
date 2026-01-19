import 'package:dream_catchers/features/auth/data/education_levels.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:dream_catchers/features/auth/widgets/signup_select_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationLevelStepWidget extends StatelessWidget {
  final RxString selectedEducationLevel;
  final Function(String) onSelectEducationLevel;

  const EducationLevelStepWidget({
    super.key,
    required this.selectedEducationLevel,
    required this.onSelectEducationLevel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignupHeading(heading: "What's your highest education level?"),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: EducationLevels.allEducationLevels.length,
            itemBuilder: (context, index) {
              final String educationLevel =
                  EducationLevels.allEducationLevels[index];
              return Obx(
                () => SignupSelectOptionWidget(
                  text: educationLevel,
                  isSelected: selectedEducationLevel.value == educationLevel,
                  onSelect: () => onSelectEducationLevel(educationLevel),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
