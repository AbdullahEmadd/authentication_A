import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io' show Platform;
import 'dart:developer' as dev;
import 'app_setting.dart';

class AppInfo {
  static PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: Platform.isIOS ? AppSetting.iosVersion : AppSetting.androidVersion,
    buildNumber: 'Unknown',
  );
  static loadAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo = info;
    AppSetting.currentVersionDrawer = packageInfo.version ;
    dev.log(info.version , name: "Version");
    dev.log(info.appName , name: "AppName");
    dev.log(info.buildNumber , name: "buildNumber");
    dev.log(info.packageName , name: "PackageName" );
  }
}
