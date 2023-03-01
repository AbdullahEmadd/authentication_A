
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

String globalLang = '';
bool isArabic = true;
bool isOutSa = false;
String? playerId ;
String googleMapKeyAndroid = "AIzaSyBtm4Jb7jeMXCdif_auEpXwVCe5SsR1uJk"; // Family Key
String googleMapKeyIOS = "AIzaSyBtm4Jb7jeMXCdif_auEpXwVCe5SsR1uJk";  // Family Key
String companyPhone = '920012051';

