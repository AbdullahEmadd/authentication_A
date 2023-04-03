import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/categories_model/main_categories_model.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';
import 'package:manager/src/services/app_services.dart';

class CategoriesController {

  static Future<bool> addMainCategory({
    required String name,
    required String companyId,
    required String logo,
    required bool isOptional,
  }) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Catogery/AddCatogery",
        body: {
          "Name": name,
          "CompanyId": companyId,
          "Logo": logo,
          "IsOptional": isOptional,
        });
    return result != null ? true : false;
  }

  static Future<bool> addSubCategory({
    required String name,
    required String companyId,
    required String logo,
    required String parentCategoryId,
  }) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Catogery/AddCatogery",
        body: {
          "Name": name,
          "CompanyId": companyId,
          "Logo": logo,
          "ParentCategoryId": parentCategoryId,
        });
    return result != null ? true : false;
  }

  static Future<List<MainCategoriesModel>> getMainCategories() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
            "Catogery/GetMainCatogreyByCompanyId?id=${globalData.companyId}",
        body: null
    );
    if (result == null) {
      return [];
    }
    return (List<MainCategoriesModel>.from(
        result.map((x) => MainCategoriesModel.fromJson(x))));
  }

  static Future<List<SubCategoriesModel>> getSubCategories(
      ) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
            "Catogery/GetSubCatogreyByCompanyId?id=${globalData.companyId}",
        body: null
    );
    if (result == null) {
      return [];
    }
    return (List<SubCategoriesModel>.from(
        result.map((x) => SubCategoriesModel.fromJson(x))));
  }

  static Future<List<SubCategoriesModel>> getSubCategoriesForMainCategory(
    {required String parentCategoryId}
      ) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "Catogery/GetSubCatogreyForMAinCatogerId?id=$parentCategoryId",
        body: null);
    if (result == null) {
      return [];
    }
    return (List<SubCategoriesModel>.from(result.map((x) => SubCategoriesModel.fromJson(x))));
  }

//   static Future<List<GetSubCatogreyAdditionsByCompanyIdModel>> getSubCatogreyAdditionsByCompanyId (
// ) async {
//     var result = await AppService.callService(
//         actionType: ActionType.get,
//         apiName: "Catogery/GetSubCatogreyAdditionsByCompanyId?companyId=${globalData.companyId}",
//         body: null);
//     if (result == null) {
//       return [];
//     }
//     return (List<GetSubCatogreyAdditionsByCompanyIdModel>.from(result.map((x) => GetSubCatogreyAdditionsByCompanyIdModel.fromJson(x))));
//   }
}
