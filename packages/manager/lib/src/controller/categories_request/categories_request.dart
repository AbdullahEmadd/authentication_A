import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/categories_model/get_sub_category_additions_by_company_id_model.dart';
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
    required bool isOptional ,
    required String parentCategoryId,
    required String? relatedCategoryId,
  }) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Catogery/AddCatogery",
        body: {
          "Name": name,
          "CompanyId": companyId,
          "Logo": logo,
          "isOptional": isOptional,
          "ParentCategoryId": parentCategoryId,
          "RelatedCategoryId": relatedCategoryId
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
    return result != null
        ? (List<MainCategoriesModel>.from(
            result.map((x) => MainCategoriesModel.fromJson(x))))
        : <MainCategoriesModel>[];
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

    return result != null
        ? (List<SubCategoriesModel>.from(
            result.map((x) => SubCategoriesModel.fromJson(x))))
        : <SubCategoriesModel>[];
  }

   static Future<List<GetSubCategoryAdditionsByCompanyIdModel>> getSubCategoryAdditionsByCompanyId (
) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "Catogery/GetSubCatogreyAdditionsByCompanyId?companyId=${globalData.companyId}",
        body: null);

    return result != null
        ? (List<GetSubCategoryAdditionsByCompanyIdModel>.from(result
            .map((x) => GetSubCategoryAdditionsByCompanyIdModel.fromJson(x))))
        : [];
  }
}
