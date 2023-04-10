import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/src/components/custom_alert_select_item.dart';
import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/cubits/select_items_cubit/selectitems_cubit.dart';
import 'package:manager/src/helpers/custom_select_item_validator.dart';
import 'package:manager/src/helpers/get_message_snackbar.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/items.dart';
import 'package:manager/src/models/main_units_model/main_units_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/manager_screens/unit_screens/add_sub_unit_screen/add_sub_unit_screen.dart';
import 'package:manager/src/screens/manager_screens/unit_screens/get_sub_units_screen/get_sub_units_view_model.dart';

class AddSubUnitViewModel {
  late AddSubUnitScreen addSubUnitScreen;
  GetSubUnitsViewModel getSubUnitsViewModel = GetSubUnitsViewModel();
  Loading loading = Loading();
  TextEditingController subUnitName = TextEditingController();
  TextEditingController symbol = TextEditingController();
  TextEditingController quantityPerUnit = TextEditingController();
  TextEditingController quantityPerUnitGroup = TextEditingController();
  GlobalKey<FormState> addSubUnitKey = GlobalKey<FormState>();
  SelectItemsCubit getMainUnitCubit =
      SelectItemsCubit(errorText: "هذا الحقل مطلوب");
  List<MainUnitsModel> listMainUnit = [];

  initData() async {
    addSubUnitScreen = Get.arguments;
    await getMainUnit();
  }

  addSubUnit() async {
    bool result1 = addSubUnitKey.currentState!.validate();
    bool getMainUnitValidation = SelectItemValidator.validationFunction(
        selectItemsCubitList: [getMainUnitCubit]);
    if (result1 & getMainUnitValidation) {
      loading.show;
      bool? result = await UnitsController.addSubUnits(
          name: subUnitName.text,
          companyId: globalData.companyId!,
          unitGroupId: getMainUnitCubit.state.selectedItems!.key.toString(),
          symbol: symbol.text,
          quantityPerUnit: quantityPerUnit.text,
          quantityPerUnitGroup: quantityPerUnitGroup.text);
      if (result) {
        await addSubUnitScreen.getSubUnitsViewModel!.initData();
        getMessageSnackBar(messageText: "تم اضافه الوحدة بنجاح");
        goBack();
      }
      loading.hide;
    }
  }

  getMainUnit() async {
    loading.show;
    listMainUnit = await UnitsController.getMainUnits();
    for (MainUnitsModel element in listMainUnit) {
      if (element.id == addSubUnitScreen.getSubUnitsViewModel!.unitId) {
        getMainUnitCubit
            .selectItems(Item(key: element.id, value: element.name));
        loading.hide;
        return;
      }
    }
    loading.hide;
  }

  getMainUnitDialog(String displayName) {
    getMainUnitCubit.loadData(
        listMainUnit.map((e) => Item(key: e.id, value: e.name)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainUnitCubit,
      afterSelectItem: (Item item) {},
    );
  }
}
