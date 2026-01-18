import 'package:dream_catchers/common_widgets/buttons/custom_back_button.dart';
import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:dream_catchers/features/auth/controllers/registration_controller.dart';
import 'package:dream_catchers/features/auth/widgets/house_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HouseRulesScreen extends GetView<RegistrationController> {
  const HouseRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.03.sh,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              SizedBox(height: 0.03.sh),
              Text.rich(
                TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'Ask Asap',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.01.sh),
              Text(
                'Please follow these House Rules.',
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 0.03.sh),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HouseRule(
                        title: 'Stay Safe',
                        description: 'Try to stay anonymous. ',
                        boldText: 'Do not',
                        descriptionAfter:
                            ' give out sensitive details such as your name, address, bank account, phone number, etc.',
                      ),
                      const HouseRule(
                        title: 'Respect Others',
                        description: 'Treat others how you want to be treated.',
                      ),
                      const HouseRule(
                        title: 'Be Vigilant',
                        description: '',
                        boldText: 'Always',
                        descriptionAfter:
                            ' report suspicious behaviour or activity.',
                      ),
                      const HouseRule(
                        title: 'Be Real',
                        description:
                            'Answer Ask Asap\'s questions honestly to ensure higher accuracy in matching.',
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'More on ',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: 'community guidelines.',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'I Agree',
                function: controller.navigateBackFromHouseRules,
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
