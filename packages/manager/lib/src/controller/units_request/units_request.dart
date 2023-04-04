import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/main_units_model/main_units_model.dart';
import 'package:manager/src/services/app_services.dart';

class UnitsController {
  static Future<List<MainUnitsModel>> getMainUnits(
      {required String companyId}) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName:
        "UnitGroup/GetUnitGroupByCompanyId?id=${globalData.companyId}",
        body: null);
    if (result == null) {
      return [];
    }
    return (List<MainUnitsModel>.from(
        result.map((x) => MainUnitsModel.fromJson(x))));
  }

  static Future<bool> addMainUnits({required String name, required String companyId})async{
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "UnitGroup/AddUnitGroup",
        body: {
          "Name": name,
          "CompanyId": companyId
        });
    return result != null ? true : false;
  }
}