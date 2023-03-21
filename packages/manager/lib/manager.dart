// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/routes/routes.dart';
import 'src/screens/managers_screens/manager_home_screen/manager_home_screen.dart';
import 'src/utility/app_theme.dart';

class StartManagerCycle extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final String? companyId;

  StartManagerCycle({
  this.companyId,
});

  @override
  Widget build(BuildContext context) {
    globalData.companyId = companyId;
    return ScreenUtilInit(
        designSize: const Size(360,690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            key: const Key("manager_cycle_key"),
            scaffoldMessengerKey: scaffoldKey,
            navigatorKey: navigatorKey,
            locale: const Locale("ar"),
            routes: appRoutes(context),
            debugShowCheckedModeBanner: false,
            title: 'Manager',
            theme: appTheme,
            home: ManagerHomeScreen(),
          );
        });
  }
}

