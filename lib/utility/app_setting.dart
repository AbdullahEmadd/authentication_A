
import 'package:flutter/material.dart';

class AppSetting {
  /// DEVELOPMENT
  //   static const String serviceURL = 'https://dev.excp.sa:8019/'; // Eltanmia
  //   static const String serviceURL = 'https://dev.excp.sa:8018/'; // Eitinaa

  /// TEST
  //   static const String serviceURL = 'https://dev.excp.sa:8029/'; // Eitinaa
  //   static const String serviceURL = 'https://dev.excp.sa:8036/';// Eltanmia
  //   static const String serviceURL = 'https://dev.excp.sa:8026/';// Emdad
  //   static const String serviceURL = 'https://dev.excp.sa:8018/'; // Sarhad
  //   static const String serviceURL = 'https://rao.sa:8019/'; // // Rahat Alosra

  ///TEST ON LIVE
  //   static const String serviceURL = 'https://etanmia.excp.sa:8010/'; // Eltanmia
  static const String serviceURL ='http://kitchenapi.excprotection.com/';//refd live
  // static const String serviceURL = 'https://rao.sa:8022/'; // Rahat Alosra

  ///LIVE
  //   static const String serviceURL = 'https://etanmia.excp.sa:8006/'; //  Etanmia
  //   static const String serviceURL = 'https://dev.excp.sa:8059/';  //Sarhad
  //   static const String serviceURL = 'https://rao.sa:8004/'; // Rahat Alosra

  static const String getLocationUrl = 'http://www.geoplugin.net/json.gp?jsoncallback=?';
  // static const String getLocationUrl = 'http://ip-api.com/json/?fields=countryCode';
  static const bool isTestMode = false;
  static const int pageSize = 10;
  static  String currentVersionDrawer = '';
  static const String privacyPolicy = 'https://www.mediafire.com/file/des4h2siulbulrh/Rahat_Policy.html/file';
  static const String androidVersion = '2.0.2';
  static const String iosVersion = '3.0.1';
  static const String oneSignalKey = "91905493-ef34-45bd-a285-438ef50c5bf2"; // Family App Id

}
// PageController pageController = PageController(initialPage: Get.context.read<IndvGlobalCubit>().pageindex.value);
RegExp PhoneregExp = new RegExp(
  r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}',
  caseSensitive: false,
  multiLine: false,
);
RegExp emailregExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp passwordregExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
RegExp textnumberregExp = RegExp(r'^[0-9_\-=@,\.;]+$');
// RegExp SpecialCharacters =  RegExp( r"^[a-zA-Z0-9.a-zA-Z0-9 ! # $%&* + -/=?^_`{|}~]+\.+");

RegExp onlystringCharacters = RegExp(r"^[\p{L},.'-]*$", caseSensitive: false, unicode: true, dotAll: true);

String globalLang = '';
bool isArabic = true;
bool isOutSa = false;
String? playerId ;
String googleMapKeyAndroid = "AIzaSyBtm4Jb7jeMXCdif_auEpXwVCe5SsR1uJk"; // Family Key
String googleMapKeyIOS = "AIzaSyBtm4Jb7jeMXCdif_auEpXwVCe5SsR1uJk";  // Family Key
String companyPhone = '920012051';

