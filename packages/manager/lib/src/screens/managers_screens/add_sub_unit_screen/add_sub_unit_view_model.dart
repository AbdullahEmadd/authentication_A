import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/routes/routes.dart';

class AddSubUnitViewModel {
  Loading loading = Loading();
  TextEditingController subUnitName = TextEditingController();
  GlobalKey<FormState> addSubUnitKey = GlobalKey<FormState>();

  addSubUnit()async{
    loading.show;
    bool? result = await UnitsController.addSubUnits(
        name: subUnitName.text,
        companyId: globalData.companyId!,
        unitGroupId: "fafa1aa8-0f8f-4bd4-93d8-4ca9cacc8d2e",
        symbol: "KG"
    );
    if (result) {
      Get.snackbar('Success', "تم اضافه الوحدة بنجاح");
      globalData.getSubUnitsViewModel.getSubUnits();
      goBack();
    }
    loading.hide;
  }

}