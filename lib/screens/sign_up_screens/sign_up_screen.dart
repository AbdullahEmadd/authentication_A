// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/login_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/button.dart';
import '../../components/custom_text_field.dart';
import '../../cubits/sign_up/sign_up_cubit.dart';
import '../../utility/app_colors.dart';
import '../../utility/app_names.dart';
import 'package:get/get.dart';
import '../verify_code_screens/verify_code_screen.dart';
class SignUpScreen extends StatefulWidget {
  static String routeName = '/SignUpScreen';
  final formKey = GlobalKey<FormState>();
  SignUpCubit signUpCubit = SignUpCubit();
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  AppNames.welcome,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 25,
                    fontFamily: 'Almarai'
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppNames.registerUsing,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "ALMARAI",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.RegisterText,
                  controller: BlocProvider.of<SignUpCubit>(context, listen: false).nameController,
                  hint: AppNames.name,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.RegisterText,
                  controller: BlocProvider.of<SignUpCubit>(context, listen: false).userNameController,
                  hint: AppNames.userName,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.Email,
                  controller: BlocProvider.of<SignUpCubit>(context, listen: false).emailController,
                  hint: AppNames.email,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.PhoneNumber,
                  controller: BlocProvider.of<SignUpCubit>(context, listen: false).phoneController,
                  hint: AppNames.phone,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.Password,
                  controller: BlocProvider.of<SignUpCubit>(context, listen: false).passwordController,
                  hint: AppNames.password,
                  obscure: _obscure1,
                  icon: _obscure1 ? Icons.visibility_off : Icons.visibility,
                  iconPressed: _password,
                ),
                CustomTextField(
                  confirmPasswordController: BlocProvider.of<SignUpCubit>(context, listen: false).passwordController,
                  textFieldVaidType: TextFieldvalidatorType.ConfirmPassword,
                  controller: BlocProvider.of<SignUpCubit>(context, listen: false).passwordConfirmationController,
                  hint: AppNames.passwordConfirm,
                  obscure: _obscure2,
                  icon: _obscure2 ? Icons.visibility_off : Icons.visibility,
                  iconPressed: _confirmPassword,
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<SignUpCubit, SignUpState> (
                listener:(context, state) {
                if(state is SignUpDone){
                Get.snackbar('تم', state.signUpModel.message![0].value.toString());
                goToScreen(screenNames: ScreenNames.verifyCodeScreen);
                }
                },
                builder: (context,state) {
                    return state is! SignUpLoading ? Button(
                    text: AppNames.registerAsAdmin,
                    function: () {
                      if (formKey.currentState?.validate() == true) {
                        BlocProvider.of<SignUpCubit>(context, listen: false).adminSignUp();
                      }
                    },
                  ) : CircularProgressIndicator();
                }
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
