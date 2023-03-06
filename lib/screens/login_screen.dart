import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/screens/forget_password_screen.dart';
import 'package:first_task/screens/homepage.dart';
import 'package:first_task/screens/sign_up_screen.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/custom_text_field.dart';
import '../cubits/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_task/models/authentication/login_model.dart';
import 'package:first_task/helpers/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
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
      body: BlocConsumer <LoginCubit, LoginState>(
    listener: (context, state) async{
      if(state is LoginDone){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
          CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token!.accessToken!);
      }
    },
    builder: (context, state) {
    return SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    AppNames.welcome,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Almarai',
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      AppNames.login,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Almarai',
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.RegisterText,
                    controller: LoginCubit
                        .
                    get(context)
                        .userName,
                    hint: AppNames.email,
                  ),

                  CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.Password,
                    obscure: true,
                    controller: LoginCubit
                        .get(context)
                        .password,
                    hint: AppNames.password,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                state is! LoginLoading ? Button(
                  text: 'تسجيل الدخول',
                  function: () {
                    if(formkey.currentState!.validate()){
                      LoginCubit.get(context).userLogin(userName: LoginCubit
                          .get(context)
                          .userName
                          .text, password: LoginCubit
                          .get(context)
                          .password
                          .text);
                    }
                  },
                ): CircularProgressIndicator(),
                SizedBox(
                  height: 17,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                  },
                  child: const Text(AppNames.forgetPassword,
                  style: TextStyle(
                    fontSize: 17
                  ),),
                ),
                SizedBox(
                  height: 5,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppNames.haveCompany,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUpScreen()));
                        },
                        child: Text(AppNames.registerAsAdmin,
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ]
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
