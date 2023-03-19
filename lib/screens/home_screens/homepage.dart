import 'package:first_task/components/custom_button.dart';
import 'package:first_task/components/custom_text.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_images.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/routes.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.splash,
                  height: 330,
                ),
              ],
            ),
            SizedBox(
              height: 90.h,
            ),
            SizedBox(
                width: 107.w,
                height: 74.h,
                child: Image.asset(AppImages.logo)),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: 'Started now',
                    color: AppColors.black,
                    fontSize: 25.sp),
                SizedBox(
                  width: 5.w,
                ),
                CustomText(
                  text: 'Get',
                  color: AppColors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'We show the easy way to shop just',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ],
            ),
            CustomText(
                text: 'stay where you are',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
                width: 193.w,
                height: 40.h,
                text: AppNames.getStarted,
                function: () {
                  goToScreen(screenNames: ScreenNames.loginScreen);
                  CacheHelper.saveData(key: 'Splash', value: true);
                }),
          ],
        ),
      ),
    );
  }
}
