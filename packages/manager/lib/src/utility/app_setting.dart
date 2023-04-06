
class AppSetting {
  /// DEVELOPMENT
  // static const String serviceURL = 'http://kitchenapi.excprotection.com/';
  /// TEST
  // static const String serviceURL = 'http://kitchenapi.excprotection.com/';
  ///TEST ON LIVE
  // static const String serviceURL = 'http://kitchenapi.excprotection.com/';

  ///LIVE
  static  String serviceURL = '';

  static String globalLang = 'en';
  String? playerId;

  String googleMapKeyAndroid = ""; // Family Key
  String googleMapKeyIOS = "";
  static bool isArabic = true;
  static const String oneSignalKey = "";
}
