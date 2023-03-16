import 'package:first_task/components/custom_button.dart';
import 'package:first_task/components/custom_text.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/screens/login_screens/login_screen.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/routes.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/HomePage';
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
                  'assets/images/splash.png',
                  height: 330,
                ),
              ],
            ),
             SizedBox(
              height: 90.h,
            ),
            Transform.scale(
              scale: 0.5,
              child: Image.asset(
                'assets/images/logo.png'
              ),
            ),
            Image.asset(
                'assets/images/get_start.png'
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'We show the easy way to shop just',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ],
            ),
              CustomText(
                text: 'stay where you are',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.black
              ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              width: 193.w,
              height: 40.h,
              text: 'Get Started Now',
              function: (){
                goToScreen(screenNames: ScreenNames.loginScreen);
                CacheHelper.saveData(key: 'Splash', value: true);
              }
            ),
          ],
        ),
      ),
    );
  }
}
