import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  double? width;
  double? height;
  late bool obscure;
  String? label;
  TextStyle? hintStyle;
  IconData? icon;
  Widget? iconWidget;
  Widget? prefixIconWidget;
  Color? labelColor;
  TextInputType? textType;
  Function(String val)? onChange;
  Function()? iconPressed;
  Function()? onPressed;
  bool? enabled;
  FocusNode? focusNode;
  int? maxLines;
  int? minLines;
  CustomTextField(
      {this.controller,
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
        this.onChange});

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
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(

            validator: (value) {
              if (value == null || value.isEmpty) {
                return  "Please enter your password" ;
              } else if (value.length < 6) {
                return  'Password is less than 6 character';
              }
              return null;
            },
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
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.mainColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: Colors.transparent),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: AppColors.mainColor),
                ),
                prefixIcon: prefixIconWidget??null,
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