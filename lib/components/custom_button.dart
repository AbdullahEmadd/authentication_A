// ignore_for_file: non_constant_identifier_names

import 'package:first_task/utility/app_colors.dart';
import 'package:flutter/material.dart';


Widget CustomButton({
  double height= 45,
  double width = double.infinity,
  required String text,
  required void Function()? function,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Almarai',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );