import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
import 'package:first_task/helpers/Validation.dart';
class CustomTextField extends StatefulWidget {
  TextFieldvalidatorType? textFieldVaidType;
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
        this.onChange});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: widget.onPressed,
        child:
        Container(
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            validator: (v) => Validation(
                type: widget.textFieldVaidType!,
                value: v!,),
            onTap: widget.onPressed,
            minLines: widget.minLines??1,
            maxLines: widget.maxLines??1,
            enabled: widget.enabled,
            keyboardType: widget.textType ?? TextInputType.text,
            controller: widget.controller,
            focusNode: widget.focusNode,
            onChanged: widget.onChange,
            obscureText: widget.obscure,
            decoration: InputDecoration(
                labelText:widget.hint??'' ,
                hintText: widget.hint ?? "",
                hintStyle:widget.hintStyle?? const TextStyle(fontSize: 12, color: Colors.grey,),
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
                prefixIcon: widget.prefixIconWidget??null,
                suffixIcon: widget.iconWidget == null
                    ? (widget.icon == null
                    ? null
                    : InkWell(
                    onTap: widget.iconPressed ?? () {},
                    child: Icon(
                      widget.icon,
                      size: 18,
                      color: AppColors.mainColor,
                    )))
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.iconWidget!,
                  ],
                )),
          ),
        ),

      ),
    );
  }
}