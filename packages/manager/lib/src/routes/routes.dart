import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manager/src/screens/manager_screens/category_screens/add_main_category_screen/add_main_category_screen.dart';
import 'package:manager/src/screens/manager_screens/category_screens/add_sub_category_screen/add_sub_category_screen.dart';
import 'package:manager/src/screens/manager_screens/products_screens/add_product_screen/add_product_screen.dart';
import 'package:manager/src/screens/manager_screens/store_screens/store_screen.dart';
import 'package:manager/src/screens/profile_screen/profile_screen.dart';
import '../screens/manager_screens/category_screens/get_main_categories_screen/get_main_categories_screen.dart';
import '../screens/manager_screens/category_screens/get_sub_categories_screen/get_sub_categories_screen.dart';
import '../screens/manager_screens/products_screens/get_products_screen/get_products_screen.dart';
import '../screens/manager_screens/unit_screens/add_main_unit_screen/add_main_unit_screen.dart';
import '../screens/manager_screens/unit_screens/add_sub_unit_screen/add_sub_unit_screen.dart';
import '../screens/manager_screens/unit_screens/get_main_units_screen/get_main_units_screen.dart';
import '../screens/manager_screens/unit_screens/get_sub_units_screen/get_sub_units_screen.dart';
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
    ScreenNames.addProductScreen: (context) => const AddProductScreen(),
    ScreenNames.storeScreen: (context) => const StoreScreen(),
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
    static String addProductScreen = "addProductScreen";
    static String storeScreen = "storeScreen";
  }