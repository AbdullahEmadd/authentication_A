import 'package:first_task/screens/forget_password_screen.dart';
import 'package:first_task/screens/homepage.dart';
import 'package:first_task/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'cubits/forget_password/forget_password_cubit.dart';
import 'cubits/login/login_cubit.dart';
import 'cubits/sign_up/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  bool firstLoad = await checksplash();
  bool login = await checklogin();
  String? role;
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
        create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<SignUpCubit>(
        create: (BuildContext context) => SignUpCubit(),
        ),
        BlocProvider<ForgetPasswordCubit>(
        create: (BuildContext context) => ForgetPasswordCubit(),)
      ],
    child:  MyApp(firstLoad: firstLoad,
    role: role,)
  ));
}
checksplash() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var splash = preferences.getBool("splash");
  print(splash);
  if (splash == true) {
    return true;
  } else {
    return false;
  }
}

checklogin() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool? state = preferences.getBool("state");
  print(state);
  if (state == true) {
    return true;
  } else {
    return false;
  }
}

class MyApp extends StatelessWidget {
  bool firstLoad;
  String? role;
  MyApp({Key? key,this.firstLoad=false,this.role}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale("ar"),
      debugShowCheckedModeBanner: false,
      title: 'First Task',
      theme: appTheme,
      home: HomePage());
  }
}
