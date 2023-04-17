import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/prod_images_model/prod_images_model.dart';
import 'package:manager/src/models/products_model/products_model.dart';
import 'package:manager/src/models/products_model/stock_products_model.dart';
import 'package:manager/src/services/app_services.dart';

class ProductsController {
  static Future<bool> addProduct(
  { required String name, required String description, required String categoryId,
    required String subCategoryId, required String companyId,
    required bool isOptional, required String image,
    required String mainUnitId}
      ) async {
    List<Map<String, Object>> list = [{"isMain": true, "Url": image}];
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Product/AddProduct",
        body: {
          "Name": name,
          "Description": description,
          "CategoryId": categoryId,
          "SubCategoryId": subCategoryId,
          "CompanyId": globalData.companyId,
          "IsOptional": isOptional,
          "ProdImages": list.map((e) => ProdImagesModel(isMain: true, url: image)).toList(),
          "virtualUnitIdFromApp": mainUnitId
        });
    return result != null ? true : false;
  }

  static Future<List<StockProductsModel>> getProductsByCategoryIdAndSubCategoryId({required categoryId, required subCategoryId}) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "CompanyStock/GetCompanyStockProducts?CompanyId=${globalData.companyId}&MainCategoryId=$categoryId&SubCategoryId=$subCategoryId",
        body: null);
    if (result == null) {
      return [];
    }
    return (List<StockProductsModel>.from(
        result.map((x) => StockProductsModel.fromJson(x))));
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
