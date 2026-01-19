import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/auth/data/sexual_orientations.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:dream_catchers/features/auth/widgets/signup_select_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SexualOrientationStepWidget extends StatelessWidget {
  final RxString selectedSexualOrientation;
  final Function(String) onSelectSexualOrientation;
  final Function() onSelectOthers;
  final bool isOthersSelected;
  const SexualOrientationStepWidget({
    super.key,
    required this.selectedSexualOrientation,
    required this.onSelectSexualOrientation,
    required this.onSelectOthers,
    required this.isOthersSelected,
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
                const SignupHeading(heading: "What's your sexual orientation?"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final sexualOrientation =
                        SexualOrientations.allSexualOrientations[index];
                    return Obx(
                      () {
                        return SignupSelectOptionWidget(
                          text: sexualOrientation,
                          isSelected: selectedSexualOrientation.value ==
                              sexualOrientation,
                          onSelect: () =>
                              onSelectSexualOrientation(sexualOrientation),
                        );
                      },
                    );
                  },
                ),
                SignupSelectOptionWidget(
                  text: isOthersSelected
                      ? selectedSexualOrientation.value
                      : "Others",
                  isSelected: isOthersSelected,
                  onSelect: onSelectOthers,
                  textColor: AppColors.darkGreyColor,
                  suffix: SvgPicture.asset(
                    AppImages.forwardArrowIcon,
                    colorFilter: ColorFilter.mode(
                      isOthersSelected
                          ? AppColors.whiteColor
                          : AppColors.darkGreyColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
