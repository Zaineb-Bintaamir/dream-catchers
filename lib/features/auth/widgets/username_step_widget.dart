import 'package:dream_catchers/common_widgets/inputs/custom_primary_textfield.dart';
import 'package:dream_catchers/core/utils/form_validators.dart';
import 'package:dream_catchers/features/auth/widgets/signup_heading.dart';
import 'package:flutter/material.dart';

class UsernameStepWidget extends StatelessWidget {
  final GlobalKey<FormState> usernameFormKey;
  final TextEditingController usernameController;
  const UsernameStepWidget({
    super.key,
    required this.usernameFormKey,
    required this.usernameController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: usernameFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignupHeading(heading: "What's your Username?"),
          CustomPrimaryTextField(
            hintText: 'Username',
            controller: usernameController,
            isPassword: false,
            keyboardType: TextInputType.text,
            validator: FormValidators.validateUsername,
            autovalidateMode: AutovalidateMode.disabled,
          ),
        ],
      ),
    );
  }
}
