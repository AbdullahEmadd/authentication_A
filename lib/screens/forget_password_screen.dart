import 'dart:developer';

import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/button.dart';
import '../cubits/forget_password/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {


  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener:(context, state) {
        },
        builder: (context, state) {
          final ForgetKey = GlobalKey<FormState>();
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: ForgetKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
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
                      SizedBox(height: 15,),
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
                        height: 50,
                      ),
                      CustomTextField(
                        textFieldVaidType: TextFieldvalidatorType.RegisterText,
                        controller: ForgetPasswordCubit
                            .get(context)
                            .userNameController,
                        hint: AppNames.userName,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Button(
                              text: AppNames.next,
                              function: (){
                                if(ForgetKey.currentState!.validate()){
                                  ForgetPasswordCubit.get(context).forgetPassword();
                                }
                                else{
                                  log('Please enter username');
                                }

                              }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
