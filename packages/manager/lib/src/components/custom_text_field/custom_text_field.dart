// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/utility/app_fonts.dart';
import '../../utility/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextFieldValidatorType? textFieldValidatorType;
  final TextEditingController? controller;
  final TextEditingController? confirmPasswordController;
  final String? firstPasswordToConfirm;
  final String? hint;
  final double? width;
  final double? height;
  final bool obscure;
  final String? label;
  final TextStyle? hintStyle;
  final IconData? icon;
  final Widget? iconWidget;
  final Widget? prefixIconWidget;
  final Color? labelColor;
  final TextInputType? textType;
  final Function(String val)? onChange;
  final Function()? iconPressed;
  final Function()? onPressed;
  final bool? enabled;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  bool isDisable = false;

   CustomTextField(
        {super.key,
        this.controller,
        this.confirmPasswordController,
        required this.textFieldValidatorType,
        this.hint = "",
        this.width,
        this.prefixIconWidget,
        this.height,
        this.obscure = false,
        this.label,
        this.hintStyle,
        this.icon,
        this.iconWidget,
        this.enabled = true,
        this.isDisable = false,
        this.labelColor,
        this.textType,
        this.onPressed,
        this.focusNode,
        this.maxLines,
        this.minLines,
        this.iconPressed,
        this.onChange,
        this.firstPasswordToConfirm,
      });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onPressed,
        child:
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (v) => validation(
              type: textFieldValidatorType!,
              firstPasswordForConfirm: textFieldValidatorType ==
                  TextFieldValidatorType.confirmPassword
                  ? confirmPasswordController!.value.text
                  : "",
              value: v!),
          onTap: onPressed,
          minLines: minLines??1,
          maxLines: maxLines??1,
          enabled: enabled,
          keyboardType: textType ?? TextInputType.text,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChange,
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: hint ?? "",
              hintStyle: hintStyle ??
                  TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontFamily: AppFonts.fontMedium),
              labelStyle: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  fontFamily: AppFonts.fontMedium),
              contentPadding: EdgeInsets.only(top: 8.h,right: 8.w,left: 8.w),
              errorStyle: TextStyle(
                  height: 1.4,
                  fontFamily: AppFonts.fontMedium,
                  fontSize: 12.sp,
                  color: Colors.red),
              fillColor: isDisable
                  ? AppColors.black.withOpacity(.1)
                  : AppColors.fillColor.withOpacity(.4),
              filled: true,
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide:  BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide:  BorderSide.none,
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide:  BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: BorderSide.none,
              ),
              prefixIcon: prefixIconWidget,
              suffixIcon: iconWidget == null
                  ? (icon == null
                  ? null
                  : InkWell(
                  onTap: iconPressed ?? () {},
                  child: Icon(
                    icon,
                    size: 18.sp,
                    color: AppColors.mainColor,
                  )))
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  iconWidget!,
                ],
              )),
        ),

      ),
    );
  }
}