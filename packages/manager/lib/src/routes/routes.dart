import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manager/src/screens/managers_screens/add_category_screens/add_main_category_screen.dart';
import 'package:manager/src/screens/profile_screen/profile_screen.dart';
part 'app_navigator.dart';

appRoutes(context) {
  var routes = {
    ScreenNames.addCategoryScreen: (context) => AddCategoryScreen(),
    ScreenNames.profileScreen: (context) => ProfileScreen(),
    };
    return routes;
}
  class ScreenNames {
    static String addCategoryScreen = "addCategoryScreen";
    static String profileScreen = "profileScreen";
  }