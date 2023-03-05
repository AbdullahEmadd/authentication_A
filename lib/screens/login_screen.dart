import 'package:first_task/screens/homepage.dart';
import 'package:first_task/screens/sign_up_screen.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/custom_text_field.dart';
import '../cubits/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
import 'package:first_task/helpers/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  controller: LoginCubit
                      .
                  get(context)
                      .userName,
                  hint: AppNames.email,
                ),

                CustomTextField(
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
                text: 'Login',
                function: () {
                  LoginCubit.get(context).userLogin(userName: LoginCubit
                      .get(context)
                      .userName
                      .text, password: LoginCubit
                      .get(context)
                      .password
                      .text);
                },
              ): CircularProgressIndicator(),
              SizedBox(
                height: 17,
              ),
              TextButton(
                onPressed: () {},
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
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (builder) => SignUpScreen()));
                      },
                      child: Text(AppNames.registerAsAdmin,
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 20,
                          )),
                    ),
                    const Text(
                      AppNames.haveCompany,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      );
  },
),
    );
  }
}
