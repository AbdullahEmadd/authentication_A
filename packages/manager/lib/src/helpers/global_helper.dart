
import 'package:manager/src/screens/managers_screens/category_screens/get_main_categories_screen/get_main_categories_view_model.dart';
import 'package:manager/src/screens/managers_screens/get_main_units_screen/get_main_units_view_model.dart';

GlobalData globalData = GlobalData();

class GlobalData{
 GetMainCategoriesViewModel getMainCategoriesViewModel = GetMainCategoriesViewModel();
 GetMainUnitsViewModel getMainUnitsViewModel = GetMainUnitsViewModel();
 String? companyId;
//  String userId = '';
}