import 'package:dream_catchers/features/auth/data/ethnicities.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:dream_catchers/features/auth/widgets/signup_select_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EthnicityStepWidget extends StatelessWidget {
  final RxString selectedEthnicity;
  final Function(String) onSelectEthnicity;

  const EthnicityStepWidget({
    super.key,
    required this.selectedEthnicity,
    required this.onSelectEthnicity,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignupHeading(heading: "What's your ethnicity?"),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: Ethnicities.allEthnicities.length,
            itemBuilder: (context, index) {
              final ethnicity = Ethnicities.allEthnicities[index];
              return Obx(
                () => SignupSelectOptionWidget(
                  text: ethnicity,
                  isSelected: selectedEthnicity.value == ethnicity,
                  onSelect: () => onSelectEthnicity(ethnicity),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
