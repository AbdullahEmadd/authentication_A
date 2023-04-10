import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/utility/app_setting.dart';
import 'src/screens/manager_screens/manager_home_screen/home_screen.dart';
import 'src/utility/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class StartManagerCycle extends StatelessWidget {
  final String? companyId;
  final String serviceURL;
  final String? name;

  const StartManagerCycle({
   super.key,
    this.companyId,
    required this.serviceURL,
    this.name,
});

  @override
  Widget build(BuildContext context) {
    globalData.companyId = companyId;
    globalData.name = name;
    AppSetting.serviceURL = serviceURL;
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
            home: const HomeScreen(),
          );
        });
  }
}

class LoadManagerPackage {
  static Function()? logout = () {};
}


