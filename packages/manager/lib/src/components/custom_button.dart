import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text.dart';
import 'package:manager/src/utility/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final void Function()? function;
  final double height;
  final double width;

  const CustomButton({super.key,
    required this.text,
    required this.function,
    this.width = double.infinity,
    this.height = 45,
    this.color,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color ?? AppColors.mainColor
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
