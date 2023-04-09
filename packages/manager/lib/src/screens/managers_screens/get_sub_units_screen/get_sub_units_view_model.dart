import 'package:get/get.dart';
import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/sub_units_model/sub_units_model.dart';

class GetSubUnitsViewModel {
  String unitId = '';
  Loading loading = Loading();
  GenericCubit<List<SubUnitsModel>> getSubUnitsModel = GenericCubit<List<SubUnitsModel>>(data: []);

  void initialize () {
    unitId = Get.arguments;
  }
  initData() async {
    await getSubUnits(unitGroupId: unitId);
  }
  getSubUnits({required String unitGroupId})async{
    loading.show;
    getSubUnitsModel.update(data: await UnitsController.getSubUnits(
      unitGroupId: unitGroupId
    ));
    loading.hide;
  }
}