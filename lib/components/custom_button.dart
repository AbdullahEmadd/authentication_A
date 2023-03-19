import 'package:first_task/components/custom_text.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? function;
  final double height;
  final double? width;

  const CustomButton({super.key,
    required this.text,
    required this.function,
    this.width,
    this.height = 45,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mainColor
      ),
      child: MaterialButton(
        onPressed: function,
        child: CustomText(
            text: text,
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
        ),
      ),
      );
  }
}
