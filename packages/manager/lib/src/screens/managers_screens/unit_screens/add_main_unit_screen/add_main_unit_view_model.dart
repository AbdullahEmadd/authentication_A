import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/get_message_snackbar.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/routes/routes.dart';

import '../get_main_units_screen/get_main_units_view_model.dart';

class AddMainUnitViewModel{
  late GetMainUnitsViewModel getMainUnitsViewModel ;
  Loading loading = Loading();
  TextEditingController mainUnitName = TextEditingController();
  GlobalKey<FormState> addMainUnitKey = GlobalKey<FormState>();

  initData(){
    getMainUnitsViewModel = Get.arguments;
  }

  addMainUnit()async{
    loading.show;
    bool? result = await UnitsController.addMainUnits(
        name: mainUnitName.text,
        companyId: globalData.companyId!);
    if (result) {
      await getMainUnitsViewModel.getMainUnits();
      getMessageSnackBar(messageText: "تم اضافه الوحدة بنجاح");
      goBack();
    }
    loading.hide;
  }
}