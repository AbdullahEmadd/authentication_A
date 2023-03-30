import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';

class AddMainUnitViewModel{
  Loading loading = Loading();
  TextEditingController mainUnitName = TextEditingController();
  GlobalKey<FormState> addMainUnitKey = GlobalKey<FormState>();

  addMainUnit()async{
    loading.show;
    bool? result = await UnitsController.addMainUnits(
        name: mainUnitName.text,
        companyId: globalData.companyId!);
    if (result) {
      Get.snackbar('Success', "تم اضافه الوحدة بنجاح");
    }
    loading.hide;
  }
}