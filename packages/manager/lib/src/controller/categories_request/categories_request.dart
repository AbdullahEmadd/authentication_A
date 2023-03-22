import 'dart:convert';
import 'package:manager/src/models/categories_model/add_categories_model.dart';
import 'package:manager/src/models/categories_model/get_main_categories_model.dart';
import 'package:manager/src/services/app_services.dart';

class CategoriesController {
  static Future<AddCategoriesModel?> addMainCategory({
    required String name,
    required String companyId,
    required String logo,
  }) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Catogery/AddCatogery",
        body: {
          "Name": name,
          "CompanyId": companyId,
          "Logo": logo,
        }
    );
    return result != null ? AddCategoriesModel.fromJson(json.decode(result)) : null;
  }

  static Future<List<MainCategoriesModel>> getMainCategories(
      {required String companyId}
      ) async{
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "Catogery/GetMainCatogreyByCompanyId?id=0e051194-fadf-452f-b878-e2dc8014d86c",
        body: {
          "id": companyId
        }
        );
    if(result==null) {
      return [];
    }
    return (List<MainCategoriesModel>.from(
        result.map((x) => MainCategoriesModel.fromJson(x))));
  }
}