// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:first_task/components/custom_text.dart';
import 'package:first_task/components/loader_custom/loader_custom.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/sign_up_screens/sign_up_view_model.dart';
import 'package:first_task/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../utility/app_colors.dart';
import '../../utility/app_names.dart';
class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel signUpViewModel = SignUpViewModel();
  final formKey = GlobalKey<FormState>();
  bool _obscure1 = true;
  bool _obscure2 =true;

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
            leading:
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Transform.scale(
                scaleX: -1,
                child: Image(
                  image: AssetImage(AppImages.logo),
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
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: signUpViewModel.signUpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomText(
                    text: AppNames.welcome,
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomText(
                      color: AppColors.black,
                      text: AppNames.registerUsing,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.RegisterText,
                    controller: signUpViewModel.nameController,
                    hint: AppNames.name,
                  ),
                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.RegisterText,
                    controller: signUpViewModel.userNameController,
                    hint: AppNames.userName,
                  ),
                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.Email,
                    controller: signUpViewModel.emailController,
                    hint: AppNames.email,
                  ),
                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.PhoneNumber,
                    controller: signUpViewModel.phoneController,
                    hint: AppNames.phone,
                  ),
                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.Password,
                    controller: signUpViewModel.passwordController,
                    hint: AppNames.password,
                    obscure: _obscure1,
                    icon: _obscure1 ? Icons.visibility_off : Icons.visibility,
                    iconPressed: _password,
                  ),
                  CustomTextField(
                    confirmPasswordController: signUpViewModel.passwordController,
                    textFieldVaidType: TextFieldvalidatorType.ConfirmPassword,
                    controller: signUpViewModel.passwordConfirmationController,
                    hint: AppNames.passwordConfirm,
                    obscure: _obscure2,
                    icon: _obscure2 ? Icons.visibility_off : Icons.visibility,
                    iconPressed: _confirmPassword,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                      text: AppNames.registerAsAdmin,
                      function: () {
                        if (signUpViewModel.signUpKey.currentState?.validate() == true) {
                          signUpViewModel.managerSignUp();
                        }
                      },
                    )
                ],
              ),
            ),
          ),
        )
      ),
        Loader(
          loading: signUpViewModel.loading,
        ),
    ]
    );
  }
}
