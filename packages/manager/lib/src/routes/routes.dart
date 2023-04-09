import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manager/src/screens/managers_screens/category_screens/add_main_category_screen/add_main_category_screen.dart';
import 'package:manager/src/screens/managers_screens/category_screens/add_sub_category_screen/add_sub_category_screen.dart';
import 'package:manager/src/screens/managers_screens/category_screens/get_main_categories_screen/get_main_categories_screen.dart';
import 'package:manager/src/screens/managers_screens/category_screens/get_sub_categories_screen/get_sub_categories_screen.dart';
import 'package:manager/src/screens/managers_screens/products_screens/get_products_screen/get_products_screen.dart';
import 'package:manager/src/screens/managers_screens/unit_screens/add_main_unit_screen/add_main_unit_screen.dart';
import 'package:manager/src/screens/managers_screens/unit_screens/add_sub_unit_screen/add_sub_unit_screen.dart';
import 'package:manager/src/screens/managers_screens/unit_screens/get_main_units_screen/get_main_units_screen.dart';
import 'package:manager/src/screens/managers_screens/unit_screens/get_sub_units_screen/get_sub_units_screen.dart';
import 'package:manager/src/screens/profile_screen/profile_screen.dart';
part 'app_navigator.dart';

appRoutes(context) {
  var routes = {
    ScreenNames.addCategoryScreen: (context) => const AddCategoryScreen(),
    ScreenNames.addSubCategoryScreen: (context) =>  const AddSubCategoryScreen(),
    ScreenNames.profileScreen: (context) => const ProfileScreen(),
    ScreenNames.getMainCategoriesScreen: (context) => const GetMainCategoriesScreen(),
    ScreenNames.getMainUnitsScreen: (context) => const GetMainUnitsScreen(),
    ScreenNames.addMainUnitScreen: (context) => const AddMainUnitScreen(),
    ScreenNames.getSubCategoriesScreen: (context) => const GetSubCategoriesScreen(),
    ScreenNames.getProductsScreen: (context) => const GetProductsScreen(),
    ScreenNames.getSubUnitsScreen: (context) => const GetSubUnitsScreen(),
    ScreenNames.addSubUnitScreen: (context) => const AddSubUnitScreen(),
    };
    return routes;
}
  class ScreenNames {
    static String addCategoryScreen = "addCategoryScreen";
    static String addSubCategoryScreen = "addSubCategoryScreen";
    static String profileScreen = "profileScreen";
    static String getMainCategoriesScreen = "getMainCategoriesScreen";
    static String getMainUnitsScreen = "getMainUnitsScreen";
    static String addMainUnitScreen = "addMainUnitScreen";
    static String getSubCategoriesScreen = "getSubCategoriesScreen";
    static String getProductsScreen = "getProductsScreen";
    static String getSubUnitsScreen = "getSubUnitsScreen";
    static String addSubUnitScreen = "addSubUnitScreen";
  }