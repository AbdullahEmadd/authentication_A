import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/home_screens/homepage.dart';
import 'package:first_task/screens/login_screens/login_screen.dart';
import 'package:first_task/screens/managers_screens/manager_home_screen/manager_home_screen.dart';
import 'package:first_task/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/manager.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var userData = CacheHelper.getData(key: 'UserData');
  bool? splash = CacheHelper.getData(key: 'Splash');
  Widget widget;
  if (splash != null && splash) {
    if (userData != null) {
      widget = StartManagerCycle();
    }
    else {
      widget = LoginScreen();
    }
  }else {
    widget = HomePage();
  }
  runApp(MyApp(widget: widget),
  );
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp({Key? key,required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            locale: const Locale("ar"),
            routes: appRoutes(context),
            debugShowCheckedModeBanner: false,
            title: 'Kitchen app',
            theme: appTheme,
            home: widget,
        );
      });
  }
}
