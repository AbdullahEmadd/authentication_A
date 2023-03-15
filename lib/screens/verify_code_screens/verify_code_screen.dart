import 'package:first_task/components/loader_custom/loader_custom.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/forget_password_screens/forget_password_view_model.dart';
import 'package:first_task/screens/sign_up_screens/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/button.dart';
import '../../components/custom_text_field.dart';
import '../../cubits/forget_password/forget_password_cubit.dart';
import '../../cubits/sign_up/sign_up_cubit.dart';
import '../../helpers/Validation.dart';
import '../../utility/app_names.dart';
import '../managers_screens/manager_home_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  static String routeName = '/VerifyCodeScreen';

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  SignUpViewModel signUpViewModel = SignUpViewModel();
  ForgetPasswordViewModel forgetPasswordViewModel = ForgetPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: Padding(
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  const Text(
                    AppNames.enterCode,
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Form(
                    key: signUpViewModel.verifyCodeKey,
                    child: CustomTextField(
                      textFieldVaidType: TextFieldvalidatorType.EnterCode,
                      hint: AppNames.code,
                      controller: signUpViewModel.codeController,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextButton(
                      onPressed: () {
                        forgetPasswordViewModel.regenerateCode();
                      },
                      child: Text(
                        AppNames.reGenerateCode,
                        style: TextStyle(
                            fontFamily: 'Almarai',
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                          text: AppNames.next,
                          function: () {
                            if (signUpViewModel.verifyCodeKey.currentState
                                    ?.validate() ==
                                true) {
                              signUpViewModel.verifyCode();
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Loader(loading: signUpViewModel.loading),
    ]);
  }
}
