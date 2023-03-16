import 'package:package_info_plus/package_info_plus.dart';
import 'dart:developer' as dev;

class AppInfo {
  static PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: '',
    buildNumber: 'Unknown',
  );
  static loadAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo = info;
    dev.log(info.version , name: "Version");
    dev.log(info.appName , name: "AppName");
    dev.log(info.buildNumber , name: "buildNumber");
    dev.log(info.packageName , name: "PackageName" );
  }
}
