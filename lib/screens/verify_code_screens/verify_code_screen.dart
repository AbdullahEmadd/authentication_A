import 'package:first_task/routes/routes.dart';
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
  SignUpCubit signUpCubit = SignUpCubit();
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
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Form(
                  key: signUpCubit.VerifyCodeKey,
                  child: CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.EnterCode,
                    hint: AppNames.code,
                    controller: BlocProvider.of<SignUpCubit>(context, listen: false).codeController,
                  ),
                ),
                  SizedBox(
                  height: 5.h,
                ),

                BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                    listener: (context, state) async{
                      if (state is RegenerateCodeDone) {
                        if (state.regenerateCodeModel.state == true) {
                          Get.snackbar('Success', state.regenerateCodeModel.message![0]
                              .value.toString());
                        }
                        else {
                          Get.snackbar('Error', state.regenerateCodeModel.message![0]
                              .value.toString());
                        }
                      }
                    },
                      builder: (context, state) {
                          return state is! RegenerateCodeLoading? TextButton(
                          onPressed: (){
                            BlocProvider.of<ForgetPasswordCubit>(context, listen: false).regenerateCode();
                          }, child:
                          Text(AppNames.reGenerateCode,
                          style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                          ),
                          )): CircularProgressIndicator();
                          },
                        ),
                        SizedBox(
                        height: 15.h,
                        ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) async{
                        if(state is VerifyCodeDone) {
                          if (state.verifyCodeModel.state == true) {
                            Get.snackbar('Success', state.verifyCodeModel.message![0].value.toString());
                            goToScreen(screenNames: ScreenNames.managerHomeScreen);
                          }
                          else {
                            Get.snackbar('Error', state.verifyCodeModel.message![0].value.toString());
                          }
                        }
                      },
                      builder: (context, state) {
                        return state is! VerifyCodeLoading? Button(
                            text: AppNames.next,
                            function: () {
                              if (signUpCubit.VerifyCodeKey.currentState?.validate() ==true) {
                                BlocProvider.of<SignUpCubit>(context, listen: false).verifyCode();
                              }
                            }
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
    );
  }
}
