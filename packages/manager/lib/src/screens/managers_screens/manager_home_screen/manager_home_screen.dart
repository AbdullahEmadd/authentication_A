// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/manager_drawer/manager_drawer.dart';
import 'package:manager/src/utility/app_images.dart';
import 'package:manager/src/utility/app_names.dart';
import '../../../utility/app_colors.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({Key? key}) : super(key: key);

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            text: AppNames.home,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
              iconSize: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: AppNames.main,
                        fontSize: 18.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.mainColor),
                      child: IconButton(
                        onPressed: () {
                          goToScreen(
                              screenNames: ScreenNames.addCategoryScreen);
                        },
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                GridView.count(
                  childAspectRatio: 1.4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  children: [
                    Image.asset(AppImages.foods , package: 'manager',),
                    Image.asset(AppImages.extras, package: 'manager'),
                  ],
                ),
                Transform.scale(
                    scale: 0.55, child: Image.asset(AppImages.drinks, package: 'manager')),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: AppNames.mostOrdered,
                          fontSize: 18.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold),
                      TextButton(
                          onPressed: () {},
                          child: CustomText(
                            text: 'الكل',
                            fontSize: 18.sp,
                            color: AppColors.blue,
                          ))
                    ]),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(AppImages.mostOrdered2, package: 'manager'),
              ],
            ),
          ),
        ),
      ),
      drawer: ManagerDrawerScreen(),
    );
  }
}
