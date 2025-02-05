

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight ;
  final int? maxLines ;
  final double? height ;
  final TextAlign? textAlign ;

  const CustomText(
      {super.key,
        required this.text,
        required this.color,
        this.fontWeight = FontWeight.normal ,
        required this.fontSize,
        this.fontFamily = 'Almarai',
        this.textAlign ,
        this.height,
        this.maxLines = 99});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          height: height ,
          fontSize: fontSize,
          fontFamily: fontFamily,
          color: color,
          fontWeight: fontWeight
      ),
      maxLines: maxLines,
    );

  }
}

