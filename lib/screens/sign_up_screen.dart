// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/button.dart';
import '../components/custom_text_field.dart';
import '../cubits/sign_up/sign_up_cubit.dart';
import '../utility/app_colors.dart';
import '../utility/app_names.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          //centerTitle: false,
          leadingWidth: 0.0,
          title: Transform.scale(
            scaleX: -1,
            child: Image(image: AssetImage('assets/images/logo.png'),
              width: 80,
              height: 80,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.black),
            )
          ],
        ),
    body: BlocConsumer<SignUpCubit, SignUpState> (
      listener:(context, state) {},
      builder: (context,state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            key: key,
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
                controller: SignUpCubit.get(context).nameController,
                hint: AppNames.name,
              ),
              CustomTextField(
                controller: SignUpCubit.get(context).userNameController,
                hint: AppNames.userName,
              ),
              CustomTextField(
                controller: SignUpCubit.get(context).emailController,
                hint: AppNames.email,
              ),
              CustomTextField(
                controller: SignUpCubit.get(context).phoneController,
                hint: AppNames.phone,
              ),
              CustomTextField(
                controller: SignUpCubit.get(context).passwordController,
                hint: AppNames.password,
                obscure: true,
              ),
              CustomTextField(
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
                  SignUpCubit.get(context).adminSignUp();
                },
              ): CircularProgressIndicator(),
            ],
          ),
        ),
      );
      }
    )
    );
  }
}
