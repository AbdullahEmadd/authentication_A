import 'package:first_task/components/custom_text.dart';
import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/components/loader_custom/loader_custom.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/forget_password_screens/forget_password_view_model.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/custom_button.dart';

class EnterNewPasswordScreen extends StatefulWidget {

  const EnterNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EnterNewPasswordScreen> createState() => _EnterNewPasswordScreenState();
}

class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {
  String userName = '';
  ForgetPasswordViewModel forgetPasswordViewModel = ForgetPasswordViewModel();
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  void initState() {
    userName= Get.arguments;
    super.initState();
  }

  void _password() {
    setState(() {
      _obscure1 = !_obscure1;
    });
  }

  void _confirmPassword() {
    setState(() {
      _obscure2 = !_obscure2;
    });
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: forgetPasswordViewModel.newPasswordKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    CustomText(
                        text: AppNames.newPassword,
                        textAlign: TextAlign.center,
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomTextField(
                      textFieldVaidType: TextFieldvalidatorType.Password,
                      controller: forgetPasswordViewModel.passwordController,
                      hint: AppNames.newPassword,
                      obscure: _obscure1,
                      icon: _obscure1 ? Icons.visibility_off : Icons.visibility,
                      iconPressed: _password,
                    ),
                    CustomTextField(
                      confirmPasswordController:
                          forgetPasswordViewModel.passwordController,
                      textFieldVaidType: TextFieldvalidatorType.ConfirmPassword,
                      controller:
                          forgetPasswordViewModel.passwordConfirmationController,
                      hint: AppNames.reEnterNewPassword,
                      obscure: _obscure2,
                      icon: _obscure2 ? Icons.visibility_off : Icons.visibility,
                      iconPressed: _confirmPassword,
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      text: AppNames.next,
                      function: () {
                        if (forgetPasswordViewModel.newPasswordKey.currentState!.validate()== true) {
                          forgetPasswordViewModel.resetPassword(
                            userName: userName,
                          );
                        }
                      },
                    )
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
