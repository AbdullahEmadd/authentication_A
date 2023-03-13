import 'package:flutter/material.dart';
import '../screens/add_category_screen/add_category_screen.dart';
import '../screens/forget_password_screens/enter_code_screen.dart';
import '../screens/forget_password_screens/enter_new_password_screen.dart';
import '../screens/forget_password_screens/forget_password_screen.dart';
import '../screens/home_screens/homepage.dart';
import '../screens/login_screens/login_screen.dart';
import '../screens/sign_up_screens/sign_up_screen.dart';
import 'package:first_task/screens/verify_code_screens/verify_code_screen.dart';
import 'package:first_task/screens/managers_screens/manager_home_screen.dart';
import 'package:get/get.dart';
part 'app_navigator.dart';

// final Map<String, WidgetBuilder> routes = {
//   HomePage.routeName: (context) => HomePage(),
//   LoginScreen.routeName: (context) => LoginScreen(),
//   SignUpScreen.routeName: (context) => SignUpScreen(),
//   VerifyCodeScreen.routeName: (context) => VerifyCodeScreen(),
//   ManagerHomeScreen.routeName: (context) => ManagerHomeScreen(),
//   EnterCodeScreen.routeName: (context) => EnterCodeScreen(),
//   EnterNewPasswordScreen.routeName: (context) => EnterNewPasswordScreen(),
//   ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
//   AddCategoryScreen.routeName: (context) => AddCategoryScreen(),
// };

appRoutes(context) {
  var routes = {
    ScreenNames.homepage: (context) => HomePage(),
    ScreenNames.loginScreen: (context) => LoginScreen(),
    ScreenNames.signUpScreen: (context) => SignUpScreen(),
    ScreenNames.verifyCodeScreen: (context) => VerifyCodeScreen(),
    ScreenNames.managerHomeScreen: (context) => ManagerHomeScreen(),
    ScreenNames.enterCodeScreen: (context) => EnterCodeScreen(),
    ScreenNames.enterNewPasswordScreen: (context) => EnterNewPasswordScreen(),
    ScreenNames.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    ScreenNames.addCategoryScreen: (context) => AddCategoryScreen(),
    };
    return routes;
}
  class ScreenNames {
    static String homepage = HomePage.routeName;
    static String loginScreen = LoginScreen.routeName;
    static String signUpScreen = SignUpScreen.routeName;
    static String verifyCodeScreen = VerifyCodeScreen.routeName;
    static String managerHomeScreen = ManagerHomeScreen.routeName;
    static String enterCodeScreen = EnterCodeScreen.routeName;
    static String enterNewPasswordScreen = EnterNewPasswordScreen.routeName;
    static String forgetPasswordScreen = ForgetPasswordScreen.routeName;
    static String addCategoryScreen = AddCategoryScreen.routeName;
  }