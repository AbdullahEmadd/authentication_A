import 'package:flutter/material.dart';
import 'package:manager/src/utility/app_colors.dart';

class CustomFloatingAction extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final void Function()? onPressed;

  const CustomFloatingAction({
    super.key,
    this.color = AppColors.mainColor,
    this.icon = Icons.add,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    FloatingActionButton(
        backgroundColor: color,
        onPressed: onPressed,
        child: Center(
          child: Icon(icon)
        )));
  }
}
