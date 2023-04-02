import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/categories_model/drop_down_model.dart';
import 'package:manager/src/models/categories_model/main_categories_model.dart';

class GetMainCategoriesViewModel {
  Loading loading = Loading();
  GenericCubit<List<MainCategoriesModel>> getMainCategoriesModel =
      GenericCubit<List<MainCategoriesModel>>(data: []);
  GenericCubit<List<DropDownModel>> mainCategoriesNames =
      GenericCubit<List<DropDownModel>>(data: []);
  GlobalKey<FormState> dropDownKey = GlobalKey<FormState>();

  getMainCategories() async {
    loading.show;
    getMainCategoriesModel.update(
        data: await CategoriesController.getMainCategories());
    mainCategoriesNames.update(
        data: getMainCategoriesModel.state.data!
            .map((e) => DropDownModel(name: e.name, id: e.id))
            .toList());
    loading.hide;
  }
}
