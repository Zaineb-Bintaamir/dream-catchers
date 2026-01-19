import 'package:dream_catchers/common_widgets/buttons/custom_button.dart';
import 'package:dream_catchers/core/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthdayModalContent extends StatelessWidget {
  final VoidCallback onDone;
  final Function(DateTime) onDateSelected;

  const BirthdayModalContent({
    super.key,
    required this.onDone,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.05.sw,
          vertical: 0.02.sh,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Date",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 0.35.sh,
              child: CupertinoDatePicker(
                initialDateTime:
                    DateTime.now().subtract(const Duration(days: 365 * 18)),
                mode: CupertinoDatePickerMode.date,
                minimumDate: DateTime(2000),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  onDateSelected(newDate);
                },
              ),
            ),
            SizedBox(height: 0.02.sh),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
              child: CustomButton(
                text: "Done",
                function: () {
                  onDone();
                },
                isLoading: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
