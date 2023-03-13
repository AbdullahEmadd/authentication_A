import 'package:first_task/cubits/verify_code/verify_code_cubit.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/screens/forget_password_screens/enter_code_screen.dart';
import 'package:first_task/screens/forget_password_screens/forget_password_screen.dart';
import 'package:first_task/screens/home_screens/homepage.dart';
import 'package:first_task/screens/login_screens/login_screen.dart';
import 'package:first_task/screens/managers_screens/manager_home_screen.dart';
import 'package:first_task/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'cubits/forget_password/forget_password_cubit.dart';
import 'cubits/login/login_cubit.dart';
import 'cubits/sign_up/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  String? userData = CacheHelper.getData(key: 'UserData');
  Widget widget;
  if (userData != null){
      widget=ManagerHomeScreen();
        }
      else {
        widget=HomePage();
      }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
        create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<SignUpCubit>(
        create: (BuildContext context) => SignUpCubit(),
        ),
        BlocProvider<VerifyCodeCubit>(
        create: (BuildContext context) => VerifyCodeCubit(),
        ),
        BlocProvider<ForgetPasswordCubit>(
          create: (BuildContext context) => ForgetPasswordCubit(),
        ),
      ],
    child:  MyApp(widget: widget,)
  ),
  );
}
class MyApp extends StatelessWidget {
  final Widget widget;
  MyApp({Key? key,required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            locale: const Locale("ar"),
            debugShowCheckedModeBanner: false,
            title: 'First Task',
            theme: appTheme,
            home: widget,
        );
      });
  }
}
