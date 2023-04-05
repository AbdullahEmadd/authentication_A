// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/close_icon/close_icon.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/utility/app_images.dart';
import 'package:manager/src/utility/app_names.dart';
import '../../../utility/app_colors.dart';

class ManagerDrawerScreen extends StatefulWidget {
  const ManagerDrawerScreen({Key? key}) : super(key: key);
  @override
  State<ManagerDrawerScreen> createState() => _ManagerDrawerScreenState();
}

class _ManagerDrawerScreenState extends State<ManagerDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  child: Icon(Icons.menu, size: 30.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 23.w, vertical: 15.h),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: (35.r),
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                AppImages.me,
                                package: 'manager',
                              )),
                          // child: Image.asset(AppImages.me)),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: globalData.name ?? 'Abdullah',
                                fontSize: 18.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomText(
                                  text: 'EXCP',
                                  fontSize: 16,
                                  color: AppColors.mainColor),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          goBack();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.home,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {
                          goToScreen(screenNames: ScreenNames.profileScreen);
                          print('Tapped');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.profile,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.file_copy,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.orders,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.menu_book,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.menu,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {
                          goToScreen(screenNames: ScreenNames.getMainUnitsScreen);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.scale,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.units,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.store,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.companyStore,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.store,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.employeeStore,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {
                          // CacheHelper.removeData(key: 'UserData');
                          // goToWithRemoveRoute(screenNames: ScreenNames.loginScreen);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            SizedBox(width: 10.w),
                            CustomText(
                              text: AppNames.logout,
                              fontSize: 20.sp,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CloseIcon(),
        ],
      ),
    );
  }
}
