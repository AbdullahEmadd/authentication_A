// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: AppColors.mainColor,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black
    )
  ),
);

class AppStyle {
  static LinearGradient bgLinearGradientGray() {
    return const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromRGBO(90, 91, 92, 1.0),
          Color.fromRGBO(90, 91, 92, 1.0),
        ]);
  }
}