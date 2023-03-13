import 'package:flutter/material.dart';

class AppSetting {
  /// DEVELOPMENT
  // static const String serviceURL = 'http://kitchenapi.excprotection.com/';
  /// TEST
  // static const String serviceURL = 'http://kitchenapi.excprotection.com/';
  ///TEST ON LIVE
  // static const String serviceURL = 'http://kitchenapi.excprotection.com/';

  ///LIVE
  static const String serviceURL = 'http://kitchenapi.excprotection.com/';

  static String globalLang = 'en';
  String? playerId;

  String googleMapKeyAndroid = ""; // Family Key
  String googleMapKeyIOS = "";
  static const String oneSignalKey = "";
}
