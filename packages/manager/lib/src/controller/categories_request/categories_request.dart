import 'dart:convert';

import 'package:manager/src/models/categories_model/categories_model.dart';
import 'package:manager/src/services/app_services.dart';

class CategoriesController {
  static Future<CategoriesModel?> addMainCategory({
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
    return result != null ? CategoriesModel.fromJson(json.decode(result)) : null;
  }
}