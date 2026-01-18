import 'package:dream_catchers/features/auth/data/personality_types.dart';
import 'package:dream_catchers/features/auth/widgets/personality_type_card.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalityTypeStepWidget extends StatelessWidget {
  final RxString selectedPersonalityType;
  final Function(String) onSelectPersonalityType;

  const PersonalityTypeStepWidget({
    super.key,
    required this.selectedPersonalityType,
    required this.onSelectPersonalityType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SignupHeading(heading: "What's your personality type?"),
        SizedBox(height: 0.02.sh),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          child: Row(
            children: List.generate(PersonalityTypes.allPersonalityTypes.length,
                (index) {
              final String personalityType =
                  PersonalityTypes.allPersonalityTypes[index];
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: index <
                              PersonalityTypes.allPersonalityTypes.length - 1
                          ? 0.03.sw
                          : 0),
                  child: Obx(
                    () => PersonalityTypeCard(
                      text: personalityType,
                      isSelected:
                          selectedPersonalityType.value == personalityType,
                      onSelect: () => onSelectPersonalityType(personalityType),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
