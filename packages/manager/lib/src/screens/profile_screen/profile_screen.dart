
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_images.dart';
import 'package:manager/src/utility/app_names.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        textAppBar: AppNames.editProfile,),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                CircleAvatar(
                radius: (45),
                backgroundColor: Colors.white,
                child: Image.asset(AppImages.me, package: 'manager')),
                SizedBox(
                  height: 45.h,
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.gray,borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: AppNames.name,fontSize: 14.sp),
                        CustomText(text: 'Username' , fontSize: 14.sp),
                      ],),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.gray,borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: AppNames.company,fontSize: 14.sp),
                        CustomText(text: 'EXCP' , fontSize: 14.sp),
                      ],),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.gray,borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: AppNames.job,fontSize: 14.sp),
                        CustomText(text: 'Manager' , fontSize: 14.sp),
                      ],),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(
                  text: AppNames.editProfilePhoto,
                  width: 216.w,
                  function: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
