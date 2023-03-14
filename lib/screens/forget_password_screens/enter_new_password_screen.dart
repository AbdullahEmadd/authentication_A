import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/login_screens/login_screen.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/button.dart';
import '../../cubits/forget_password/forget_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterNewPasswordScreen extends StatefulWidget {
  static String routeName = '/EnterNewPasswordScreen';
  const EnterNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EnterNewPasswordScreen> createState() => _EnterNewPasswordScreenState();


}
class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.h,
              ),
              const Text(
                AppNames.newPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Almarai',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomTextField(
                textFieldVaidType: TextFieldvalidatorType.Password,
                controller: BlocProvider.of<ForgetPasswordCubit>(context, listen: false).passwordController,
                hint: AppNames.newPassword,
                obscure: _obscure1,
                icon: _obscure1 ? Icons.visibility_off : Icons.visibility,
                iconPressed: _password,
              ),
              CustomTextField(
                confirmPasswordController: BlocProvider.of<ForgetPasswordCubit>(context, listen: false).passwordController,
                textFieldVaidType: TextFieldvalidatorType.ConfirmPassword,
                controller: BlocProvider.of<ForgetPasswordCubit>(context, listen: false).passwordConfirmationController,
                hint: AppNames.reEnterNewPassword,
                obscure: _obscure2,
                icon: _obscure2 ? Icons.visibility_off : Icons.visibility,
                iconPressed: _confirmPassword,
              ),
              SizedBox(
                  height: 20.h
              ),
              BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if(state is ResetPasswordDone){
                    if(state.enterNewPasswordModel.state ==true) {
                      Get.snackbar('Success',
                          state.enterNewPasswordModel.message![0].value
                              .toString());
                      goToScreen(screenNames: ScreenNames.loginScreen);
                    }
                    else {
                      Get.snackbar('Error', state.enterNewPasswordModel.message![0].value.toString());
                    }
                  }
                },
                builder: (context, state) {
                  return state is! ResetPasswordLoading? Button(
                    text: AppNames.next,
                    function: () {
                      if (BlocProvider.of<ForgetPasswordCubit>(context, listen: false).passwordController
                          .text
                          .length >= 8 &&
                          BlocProvider.of<ForgetPasswordCubit>(context, listen: false).passwordConfirmationController
                          .text
                          .length >= 8) {
                        if (BlocProvider.of<ForgetPasswordCubit>(context, listen: false).passwordController
                            .text !=
                            BlocProvider.of<ForgetPasswordCubit>(context, listen: false).passwordConfirmationController
                                .text) {
                          Get.snackbar(
                              'Message', 'يجب ان تكون كلمه السر متطابقه');
                        }
                        else {
                          BlocProvider.of<ForgetPasswordCubit>(context, listen: false).resetPassword();
                        }
                      } else {
                        Get.snackbar('Message',
                            'يجب ادخال كلمه سر مكونه من 8 احرف او ارقام');
                      }
                    },
                  ): CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
