import 'package:manager/src/screens/managers_screens/add_category_screen/add_category_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
part 'app_navigator.dart';

appRoutes(context) {
  var routes = {
    ScreenNames.addCategoryScreen: (context) => AddCategoryScreen(),
    };
    return routes;
}
  class ScreenNames {
    static String addCategoryScreen = "addCategoryScreen";
  }