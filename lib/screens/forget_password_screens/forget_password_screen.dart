// ignore_for_file: use_key_in_widget_constructors

import 'package:first_task/components/custom_text.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/forget_password_screens/forget_password_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import '../../components/custom_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = '/ForgetPasswordScreen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordViewModel forgetPasswordViewModel = ForgetPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Transform.scale(
              scaleX: -1,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: 80.w,
                height: 80.h,
              ),
            ),
          ),
          elevation: 0,
          leadingWidth: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Transform.scale(
                scaleX: -1,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: IconButton(
              onPressed: () {
                goBack();
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Form(
                key: forgetPasswordViewModel.forgetKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    CustomText(
                      text: AppNames.forgetPassword,
                          color: AppColors.mainColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                    ),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: AppNames.companyEmail,
                          fontFamily: 'Almarai',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextField(
                      textFieldVaidType: TextFieldvalidatorType.RegisterText,
                      controller: forgetPasswordViewModel.userNameController,
                      hint: AppNames.userName,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                              text: AppNames.next,
                              function: () {
                                if (forgetPasswordViewModel
                                        .forgetKey.currentState
                                        ?.validate() ==
                                    true) {
                                  forgetPasswordViewModel.forgetPassword();
                                }
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
