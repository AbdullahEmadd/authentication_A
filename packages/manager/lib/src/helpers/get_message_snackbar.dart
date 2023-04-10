import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/custom_text/custom_text.dart';
import '../utility/app_fonts.dart';

getMessageSnackBar({SnackBarType snackBarType = SnackBarType.success , required String messageText}) {
  Get.snackbar('', "",
      borderRadius: 50.sp,
      duration: const Duration(seconds: 2),
      titleText: CustomText(
        text: snackBarType == SnackBarType.success ? "نجاح" : "عفوا",
        textAlign: TextAlign.center,
        fontSize: 14.sp,
        fontFamily: AppFonts.fontMedium,
        color: Colors.white,
      ),
      messageText: CustomText(
        text: messageText,
        textAlign: TextAlign.center,
        fontSize: 14.sp,
        fontFamily: AppFonts.fontMedium,
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      snackPosition: SnackPosition.BOTTOM,

      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
      colorText: Colors.white,
      backgroundColor: snackBarType == SnackBarType.success ? Colors.green : Colors.red);
}

enum SnackBarType { success , error}
