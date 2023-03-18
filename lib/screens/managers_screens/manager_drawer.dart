import 'package:first_task/components/close_icon.dart';
import 'package:first_task/components/custom_text.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/utility/app_images.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utility/app_colors.dart';

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
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerHeader(
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    radius: (45),
                                    backgroundColor: Colors.white,
                                    child: Image.asset(AppImages.me)),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                          text: 'Abdullah Emad',
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
                                          color: AppColors.mainColor
                                    ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){goBack();},
                            child: Row(
                              children: [
                                Icon(Icons.home, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.home,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),

                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.person, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.profile,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),

                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.file_copy, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.orders,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),

                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.menu_book, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.menu,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),

                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.scale, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.units,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),

                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.store, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.companyStore,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Icon(Icons.store, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.employeeStore,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),

                              ],
                            ),
                          ),
                          SizedBox(height: 25.h),
                          GestureDetector(
                            onTap: (){
                              CacheHelper.removeData(key: 'UserData');
                              goToWithRemoveRoute(screenNames: ScreenNames.loginScreen);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: AppColors.mainColor, size: 30,),
                                SizedBox(width: 10.w),
                                Text(AppNames.logout,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Almarai'
                                ),),
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
