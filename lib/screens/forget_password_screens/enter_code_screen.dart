import 'package:first_task/components/custom_text.dart';
import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/components/loader_custom/loader_custom.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/forget_password_screens/forget_password_view_model.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/custom_button.dart';
import '../../utility/app_names.dart';
import 'package:get/get.dart';

class EnterCodeScreen extends StatefulWidget {

  const EnterCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  String userName = '';
  ForgetPasswordViewModel forgetPasswordViewModel = ForgetPasswordViewModel();

  @override
  void initState() {
    userName= Get.arguments;
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
                    width: 80.w,
                    height: 80.h,
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                     CustomText(
                      text: AppNames.enterCode,
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Form(
                      key: forgetPasswordViewModel.enterCodeKey,
                      child: CustomTextField(
                        controller: forgetPasswordViewModel.codeController,
                        textFieldVaidType: TextFieldvalidatorType.EnterCode,
                        hint: AppNames.code,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextButton(
                        onPressed: () {
                          forgetPasswordViewModel.regenerateCode();
                        },
                        child: CustomText(
                          text: AppNames.reGenerateCode,
                              color: Colors.blue,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomButton(
                        text: AppNames.next,
                        function: () {
                          if (forgetPasswordViewModel.enterCodeKey.currentState
                                  ?.validate() ==
                              true) {
                            forgetPasswordViewModel.codeConfirmation(
                              code: forgetPasswordViewModel.codeController.text,
                              userName: userName,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
        Loader(loading: forgetPasswordViewModel.loading),
      ],
    );
  }
}
