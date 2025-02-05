import 'dart:convert';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/models/authentication/login_model.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/home_screens/homepage.dart';
import 'package:first_task/screens/login_screens/login_screen.dart';
import 'package:first_task/utility/app_setting.dart';
import 'package:first_task/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/manager.dart';

void main() async{
  //k
  //k
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  String? userData = CacheHelper.getData(key: 'UserData');
  // String? companyId = CacheHelper.getData(key: 'companyId');
  bool? splash = CacheHelper.getData(key: 'Splash');
  Widget widget;
  if (splash != null && splash) {
    if (userData != null) {
      LoginModel x  = LoginModel.fromJson(jsonDecode(userData));
      runApp(StartManagerCycle(
        companyId: x.data!.user!.companyId!,
        name: x.data!.user!.name!,
        serviceURL: AppSetting.serviceURL,
      ));
      return;
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
      minTextAdapt: true, // update
      splitScreenMode: true, // update
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
