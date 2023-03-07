// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/button.dart';
import '../components/custom_text_field.dart';
import '../cubits/sign_up/sign_up_cubit.dart';
import '../utility/app_colors.dart';
import '../utility/app_names.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  SignUpCubit signUpCubit = SignUpCubit();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            leadingWidth: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Transform.scale(
                  scaleX: -1,
                  child: Image(image: AssetImage('assets/images/logo.png'),
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
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,
                    color: Colors.black),
              ),
            )
        ),
    body: BlocConsumer<SignUpCubit, SignUpState> (
      listener:(context, state) {
        if(state is SignUpDone){
          if(state.signUpModel == true) {
            Get.snackbar('تم', state.signUpModel.message![0].value.toString());
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>LoginScreen()));
          }
        }
      },
      builder: (context,state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
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
                  height: 10,
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
                  height: 20,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.RegisterText,
                  controller: SignUpCubit.get(context).nameController,
                  hint: AppNames.name,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.RegisterText,
                  controller: SignUpCubit.get(context).userNameController,
                  hint: AppNames.userName,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.Email,
                  controller: SignUpCubit.get(context).emailController,
                  hint: AppNames.email,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.PhoneNumber,
                  controller: SignUpCubit.get(context).phoneController,
                  hint: AppNames.phone,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.Password,
                  controller: SignUpCubit.get(context).passwordController,
                  hint: AppNames.password,
                  obscure: true,
                ),
                CustomTextField(
                  textFieldVaidType: TextFieldvalidatorType.ConfirmPassword,
                  controller: SignUpCubit.get(context).passwordConfirmationController,
                  hint: AppNames.passwordConfim,
                  obscure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                state is! SignUpLoading? Button(
                  text: AppNames.registerAsAdmin,
                  function: () {
                    if(formKey.currentState!.validate()){
                      SignUpCubit.get(context).adminSignUp();
                    }
                     },
                ): CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );
      }
    )
    );
  }
}
