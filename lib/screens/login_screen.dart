import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/custom_text_field.dart';
import '../cubits/login/login_cubit.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: false,
        leadingWidth: 0.0,
        title: Transform.scale(
          scaleX: -1,
          child: Image(image: AssetImage('assets/images/logo.png'),
            width: 80,
            height: 80,
          ),
        ),
        actions:[
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward_ios_outlined,
            color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                  controller: LoginCubit.
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
                Button(
                    text: 'Login',
                    function: (){
                      LoginCubit.get(context).userLogin(userName: LoginCubit
                          .get(context)
                          .userName
                          .text, password: LoginCubit
                          .get(context)
                          .password
                          .text);
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
