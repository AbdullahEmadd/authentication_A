import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/products_model/products_model.dart';
import 'package:manager/src/services/app_services.dart';

class ProductsController {
  static Future<List<ProductsModel>> getProducts() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "Product/GetProductByCompanyId?id=${globalData.companyId}",
        body: null);
    if (result == null) {
      return [];
    }
    return (List<ProductsModel>.from(
        result.map((x) => ProductsModel.fromJson(x))));
  }
}
