import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/button.dart';
import '../../cubits/forget_password/forget_password_cubit.dart';
import '../../utility/app_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'enter_new_password_screen.dart';
class EnterCodeScreen extends StatefulWidget {
  static String routeName = '/EnterCodeScreen';
  const EnterCodeScreen({Key? key}) : super(key: key);
  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}
class _EnterCodeScreenState extends State<EnterCodeScreen> {
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
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
                  height: 60.h,
                ),
                Form(
                  key: forgetPasswordCubit.EnterCodeKey,
                  child: CustomTextField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context, listen: false).codeController,
                    textFieldVaidType: TextFieldvalidatorType.EnterCode,
                    hint: AppNames.code,
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
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(
                          listener: (context, state) async{
                            if (state is CodeConfirmationDone) {
                              if (state.enterCodeModel.state == true) {
                                Get.snackbar('Success', state.enterCodeModel.message![0]
                              .value.toString());
                            goToScreen(screenNames: ScreenNames.enterNewPasswordScreen);
                          }
                        else {
                          Get.snackbar('خطأ', state.enterCodeModel.message![0]
                              .value.toString());
                        }
                        }
                        },
                        builder: (context, state) {
                          return state is! CodeConfirmationLoading? Button(
                              text: AppNames.next,
                              function: () {
                            if (forgetPasswordCubit.EnterCodeKey.currentState?.validate()==true) {
                              BlocProvider.of<ForgetPasswordCubit>(context, listen: false).codeConfirmation();
                            } else{
                             Get.snackbar('Error', 'Please enter valid code');
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
