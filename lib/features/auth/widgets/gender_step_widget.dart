import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/core/themes/app_images.dart';
import 'package:dream_catchers/features/auth/data/genders.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:dream_catchers/features/auth/widgets/signup_select_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GenderStepWidget extends StatelessWidget {
  final RxString selectedGender;
  final Function(String) onSelectGender;
  final Function() onSelectOthers;
  final bool isOthersSelected;
  const GenderStepWidget(
      {super.key,
      required this.selectedGender,
      required this.onSelectGender,
      required this.onSelectOthers,
      required this.isOthersSelected});

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
                const SignupHeading(heading: "What gender do you identify as?"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final gender = Genders.allGenders[index];
                    return Obx(
                      () {
                        return SignupSelectOptionWidget(
                          text: gender,
                          isSelected: selectedGender.value == gender,
                          onSelect: () => onSelectGender(gender),
                        );
                      },
                    );
                  },
                ),
                SignupSelectOptionWidget(
                  text: isOthersSelected ? selectedGender.value : "Others",
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
