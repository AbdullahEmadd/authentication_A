import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/main_units_model/main_units_model.dart';

class GetMainUnitsViewModel {
  Loading loading = Loading();
  GenericCubit<List<MainUnitsModel>> getMainUnitsModel = GenericCubit<List<MainUnitsModel>>(data: []);

  getMainUnits()async{
    loading.show;
    getMainUnitsModel.update(data: await UnitsController.getMainUnits());
    loading.hide;
  }
}