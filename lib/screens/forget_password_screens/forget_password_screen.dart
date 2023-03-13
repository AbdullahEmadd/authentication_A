import 'dart:developer';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/forget_password_screens/enter_code_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/button.dart';
import '../../cubits/forget_password/forget_password_cubit.dart';
import '../../models/authentication/forget_password_return_model.dart';
import '../home_screens/homepage.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = '/ForgetPasswordScreen';


  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: forgetPasswordCubit.ForgetKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  const Text(
                    AppNames.forgetPassword,
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        color: AppColors.mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15.h),
                  const Text(
                    AppNames.companyEmail,
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType
                        .RegisterText,
                    controller: ForgetPasswordCubit
                        .get(context)
                        .userNameController,
                    hint: AppNames.userName,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                      listener: (context, state) async{
                        if (state is ForgetPasswordDone) {
                          if (state.forgetpasswordreturnmodel.state == true) {
                            goToScreen(screenNames: ScreenNames.enterCodeScreen);
                          }
                          else {
                            Get.snackbar('خطأ', state.forgetpasswordreturnmodel.message![0]
                                    .value.toString());
                            log('Error');
                          }
                        }
                      },
                      builder: (context, state) {
                        return state is! ForgetPasswordLoading? Expanded(
                          child: Button(
                      text: AppNames.next,
                      function: () {
                          if (forgetPasswordCubit.ForgetKey.currentState?.validate()==true) {
                            ForgetPasswordCubit.get(context)
                                .forgetPassword();
                          }
                          else {
                            log('Please enter username');
                            }
                          }
                      ),
                        ): CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
