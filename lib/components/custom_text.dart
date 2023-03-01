import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final double fontSize;
  final bool bold;
  final FontWeight? fontWeight ;
  final int? maxLines ;
  final double? height ;
  final TextAlign? textAlign ;

  const CustomText(
      {Key? key,
        required this.text,
        required this.color,
        this.bold = false,
        this.fontWeight = FontWeight.normal ,
        required this.fontSize,
        required this.fontFamily ,
        this.textAlign ,
        this.height,
        this.maxLines = 99})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          height: height!=null? height:null ,
          fontSize: fontSize,
          fontFamily: fontFamily,
          color: color,
          fontWeight: bold ? FontWeight.bold : fontWeight

      ),
      maxLines: maxLines,
    );

  }
}

