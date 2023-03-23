// ignore_for_file: use_key_in_widget_constructors

import 'package:first_task/components/custom_text.dart';
import 'package:first_task/components/loader_custom/loader_custom.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/verify_code_screens/verify_code_view_model.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../helpers/Validation.dart';
import '../../utility/app_names.dart';

class VerifyCodeScreen extends StatefulWidget {
  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  VerifyCodeViewModel verifyCodeViewModel = VerifyCodeViewModel();
  List<String>? x;

  @override
  void initState() {
    x=Get.arguments;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Transform.scale(
                scaleX: -1,
                child: Image(
                  image: AssetImage(AppImages.logo),
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
                  goToScreenpopAndPushNamed(screenNames: ScreenNames.loginScreen);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Form(
                  key: verifyCodeViewModel.verifyKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130.h,
                      ),
                      CustomText(
                          text: AppNames.enterCode,
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomTextField(
                        textFieldVaidType: TextFieldvalidatorType.EnterCode,
                        hint: AppNames.code,
                        controller: verifyCodeViewModel.codeController,
                        textType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextButton(
                        onPressed: () {
                          verifyCodeViewModel.regenerateCode(
                            userName: x![0]
                          );
                        },
                        child: CustomText(
                            text: AppNames.reGenerateCode,
                            color: Colors.blue,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomButton(
                          text: AppNames.next,
                          function: () {
                            if (verifyCodeViewModel.verifyKey.currentState!.validate() == true) {
                              verifyCodeViewModel.verifyCode(
                                  userName: x![0],
                                  password:x![1],
                                  code: verifyCodeViewModel.codeController.text);
                            }
                          }
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Loader(loading: verifyCodeViewModel.loading),
      ],
    );
  }
}
