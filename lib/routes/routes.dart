import 'package:flutter/material.dart';
import '../screens/forget_password_screens/enter_code_screen.dart';
import '../screens/forget_password_screens/enter_new_password_screen.dart';
import '../screens/forget_password_screens/forget_password_screen.dart';
import '../screens/home_screens/homepage.dart';
import '../screens/login_screens/login_screen.dart';
import '../screens/sign_up_screens/sign_up_screen.dart';
import 'package:first_task/screens/verify_code_screens/verify_code_screen.dart';
import 'package:get/get.dart';
part 'app_navigator.dart';

appRoutes(context) {
  var routes = {
    ScreenNames.homepage: (context) => HomePage(),
    ScreenNames.loginScreen: (context) => LoginScreen(),
    ScreenNames.signUpScreen: (context) => SignUpScreen(),
    ScreenNames.verifyCodeScreen: (context) => VerifyCodeScreen(),
    ScreenNames.enterCodeScreen: (context) => EnterCodeScreen(),
    ScreenNames.enterNewPasswordScreen: (context) => EnterNewPasswordScreen(),
    ScreenNames.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    };
    return routes;
}
  class ScreenNames {
    static String homepage = "homePage";
    static String loginScreen = "loginScreen";
    static String signUpScreen = "signUpScreen";
    static String verifyCodeScreen = "verifyScreen";
    static String enterCodeScreen = "enterCodeScreen";
    static String enterNewPasswordScreen = "enterNewPasswordScreen";
    static String forgetPasswordScreen = "forgetPasswordScreen";
  }