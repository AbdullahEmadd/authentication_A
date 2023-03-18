// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
import 'package:first_task/helpers/Validation.dart';
class CustomTextField extends StatelessWidget {
  final TextFieldvalidatorType? textFieldVaidType;
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

  const CustomTextField(
        {Key? key,
        this.controller,
        this.confirmPasswordController,
        required this.textFieldVaidType,
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
        Container(
          height: height ?? 48,
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (v) => Validation(
                type: textFieldVaidType!,
                firstPasswordForConfirm: textFieldVaidType ==
                    TextFieldvalidatorType.ConfirmPassword
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
                labelText:hint??'' ,
                hintText: hint ?? "",
                hintStyle:hintStyle?? const TextStyle(fontSize: 12, color: Colors.grey,),
                // labelText: label,
                // labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: const EdgeInsets.only(top: 8,right: 8,left: 8),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.mainColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:  BorderSide(color: Colors.transparent),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:  BorderSide(color: AppColors.mainColor),
                ),
                prefixIcon: prefixIconWidget,
                suffixIcon: iconWidget == null
                    ? (icon == null
                    ? null
                    : InkWell(
                    onTap: iconPressed ?? () {},
                    child: Icon(
                      icon,
                      size: 18,
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

      ),
    );
  }
}