import 'package:manager/src/screens/manager_screens/products_screens/get_products_screen/get_products_view_model.dart';

GlobalData globalData = GlobalData();

class GlobalData{
 GetProductsViewModel getProductsViewModel = GetProductsViewModel();
 String? companyId;
 String? name;
}