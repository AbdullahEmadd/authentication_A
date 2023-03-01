// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

Widget Button({
  double height = 50,
  double width = 250,
  required String text,
  required void Function()? function,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xffFF7642),
        borderRadius: BorderRadius.circular(200),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),

    );