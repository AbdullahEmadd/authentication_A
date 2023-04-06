import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/sub_units_model/sub_units_model.dart';

class GetSubUnitsViewModel {
  Loading loading = Loading();
  GenericCubit<List<SubUnitsModel>> getSubUnitsModel = GenericCubit<List<SubUnitsModel>>(data: []);

  getSubUnits()async{
    loading.show;
    getSubUnitsModel.update(data: await UnitsController.getSubUnits());
    loading.hide;
  }
}