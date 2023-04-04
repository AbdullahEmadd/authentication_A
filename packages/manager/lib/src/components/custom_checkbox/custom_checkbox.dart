import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/utility/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool? value;
  final void Function(bool?) onChanged;
  final String text;

   const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged
        ),
        CustomText(
          text: text,
          color: AppColors.mainColor,
          fontSize: 15.sp,
        ),
      ],
    );
  }
}
