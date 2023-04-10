import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/products_model/products_model.dart';
import 'package:manager/src/services/app_services.dart';

class ProductsController {
  static Future<bool> addProduct(
  {required String name, required String categoryId, required String subCategoryId, required String companyId,
  required bool isOptional}
      ) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Product/AddProduct",
        body: {
          "Name": name,
          "CategoryId": categoryId,
          "SubCategoryId": subCategoryId,
          "CompanyId": globalData.companyId,
          "IsOptional": isOptional,
        });
    return result != null ? true : false;
  }

  static Future<List<ProductsModel>> getProductsByCategoryIdAndSubCategoryId() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "Product/GetAllProductByCatogreyIdAndSubCategory?SubCategory=757b6994-5aac-4f51-94e7-78e2cdfff1e2&CompanyId=${globalData.companyId}&CatogreyId=17f78ef7-3cfa-416f-9fe0-38709c4267d3",
        body: null);
    if (result == null) {
      return [];
    }
    return (List<ProductsModel>.from(
        result.map((x) => ProductsModel.fromJson(x))));
  }

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
