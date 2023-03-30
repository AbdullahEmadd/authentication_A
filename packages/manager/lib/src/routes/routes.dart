import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manager/src/screens/managers_screens/add_category_screens/add_main_category_screen.dart';
import 'package:manager/src/screens/managers_screens/add_category_screens/add_sub_category_screen.dart';
import 'package:manager/src/screens/managers_screens/add_main_unit_screen/add_main_unit_screen.dart';
import 'package:manager/src/screens/managers_screens/get_categories_screens/get_main_categories_screen.dart';
import 'package:manager/src/screens/managers_screens/get_categories_screens/get_sub_categories_screen.dart';
import 'package:manager/src/screens/managers_screens/get_main_units_screen/get_main_units_screen.dart';
import 'package:manager/src/screens/profile_screen/profile_screen.dart';
part 'app_navigator.dart';

appRoutes(context) {
  var routes = {
    ScreenNames.addCategoryScreen: (context) => AddCategoryScreen(),
    ScreenNames.addSubCategoryScreen: (context) => AddSubCategoryScreen(),
    ScreenNames.profileScreen: (context) => ProfileScreen(),
    ScreenNames.getMainCategoriesScreen: (context) => GetMainCategoriesScreen(),
    ScreenNames.getSubCategoriesScreen: (context) => GetSubCategoriesScreen(),
    ScreenNames.getMainUnitsScreen: (context) => GetMainUnitsScreen(),
    ScreenNames.addMainUnitScreen: (context) => AddMainUnitScreen(),
    };
    return routes;
}
  class ScreenNames {
    static String addCategoryScreen = "addCategoryScreen";
    static String addSubCategoryScreen = "addSubCategoryScreen";
    static String profileScreen = "profileScreen";
    static String getMainCategoriesScreen = "getMainCategoriesScreen";
    static String getSubCategoriesScreen = "getSubCategoriesScreen";
    static String getMainUnitsScreen = "getMainUnitsScreen";
    static String addMainUnitScreen = "addMainUnitScreen";
  }