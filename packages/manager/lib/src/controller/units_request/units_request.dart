import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/main_units_model/main_units_model.dart';
import 'package:manager/src/models/sub_units_model/sub_units_model.dart';
import 'package:manager/src/services/app_services.dart';

class UnitsController {
  static Future<List<MainUnitsModel>> getMainUnits() async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "UnitGroup/GetUnitGroupByCompanyId?id=${globalData.companyId}",
        body: null);
    if (result == null) {
      return [];
    }
    return (List<MainUnitsModel>.from(
        result.map((x) => MainUnitsModel.fromJson(x))));
  }

  static Future<List<SubUnitsModel>> getSubUnits(
  {required String unitGroupId}
      ) async {
    var result = await AppService.callService(
        actionType: ActionType.get,
        apiName: "Unit/GetUnitByCompanyIdAndGroupUnitId?CompanyId=${globalData.companyId}&GroupUnitId=$unitGroupId",
        body: null);
    return result != null
        ? (List<SubUnitsModel>.from(
            result.map((x) => SubUnitsModel.fromJson(x))))
        : <SubUnitsModel>[];
  }

  static Future<bool> addMainUnits(
      {required String name, required String companyId}) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "UnitGroup/AddUnitGroup",
        body: {"Name": name, "CompanyId": companyId});
    return result != null ? true : false;
  }

  static Future<bool> addSubUnits(
      {required String name, required String companyId, required String unitGroupId, required String symbol,
        required String quantityPerUnit,
        required String quantityPerUnitGroup}) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Unit/AddUnit",
        body: {
          "Name": name,
          "CompanyId": companyId,
          "UnitGroupId": unitGroupId,
          "Symbol": symbol,
          "QuantityPerUnit": quantityPerUnit,
          "QuantityPerUnitGroup": quantityPerUnitGroup,
        });
    return result != null ? true : false;
  }

}
