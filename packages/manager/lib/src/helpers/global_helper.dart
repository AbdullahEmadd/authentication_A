import 'package:manager/src/screens/managers_screens/unit_screens/get_main_units_screen/get_main_units_view_model.dart';
import 'package:manager/src/screens/managers_screens/unit_screens/get_sub_units_screen/get_sub_units_view_model.dart';

GlobalData globalData = GlobalData();

class GlobalData{
 GetMainUnitsViewModel getMainUnitsViewModel = GetMainUnitsViewModel();
 GetSubUnitsViewModel getSubUnitsViewModel = GetSubUnitsViewModel();
 String? companyId;
 String? name;
}