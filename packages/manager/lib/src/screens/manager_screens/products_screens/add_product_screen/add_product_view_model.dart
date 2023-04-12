import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:manager/src/components/custom_alert_select_item.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/controller/products_request/products_request.dart';
import 'package:manager/src/controller/units_request/units_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/select_items_cubit/selectitems_cubit.dart';
import 'package:manager/src/helpers/get_message_snackbar.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/helpers/image_picker.dart';
import 'package:manager/src/models/categories_model/main_categories_model.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';
import 'package:manager/src/models/main_units_model/main_units_model.dart';
import 'package:manager/src/screens/manager_screens/category_screens/add_sub_category_screen/add_sub_category_view_model.dart';
import '../../../../cubits/loading_cubit/loading_cubit.dart';
import '../../../../models/items.dart';

class AddProductViewModel {
  String base64 = '';
  Loading loading = Loading();
  SelectItemsCubit getMainCategoryCubit = SelectItemsCubit(
      errorText: "هذا الحقل مطلوب");
  List<MainCategoriesModel> listMainCategory = [];
  GenericCubit<File?> selectedImagePath = GenericCubit();
  GenericCubit<bool> isImage = GenericCubit(data: false);
  GlobalKey<FormState> addProductKey = GlobalKey<FormState>();
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  List<SubCategoriesModel> listSubCategories = [];
  GenericCubit<List<SubCategoriesModel>> getSubCategoriesForMainCategoryModel = GenericCubit<List<SubCategoriesModel>>(data: []);
  List<MainUnitsModel> listMainUnits = [];
  GenericCubit<List<MainUnitsModel>> getMainUnitsModel = GenericCubit<List<MainUnitsModel>>(data: []);
  SelectItemsCubit getSubCategoryCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");

  initialize()  {
    getMainCategories();
    getMainUnits();
  }

  addProduct() async {
    loading.show;
    bool? result = await ProductsController.addProduct(
        name: productName.text,
        categoryId: addSubCategoryViewModel.getMainCategoryCubit.state
            .selectedItems!.key.toString(),
        subCategoryId: '',
        companyId: globalData.companyId!,
        isOptional: true
    );
    if (result) {
      // await addSubCategoryScreen.getSubCategoriesViewModel!.initData();
      getMessageSnackBar(messageText: "تم اضافه التصنيف بنجاح");
      // goBack();
    }
    loading.hide;
  }

  getMainCategories() async {
    loading.show;
    listMainCategory = await CategoriesController.getMainCategories();
    loading.hide;
  }

  getMainCategoryDialog(String displayName) {
    getMainCategoryCubit.loadData(listMainCategory.map((e) => Item(key: e.id, value: e.name , isOptional: e.isOptional)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainCategoryCubit,
      afterSelectItem: (Item item) {
        getSubCategories(parentCategoryId:
        getMainCategoryCubit.state.selectedItems!.key!);
      },
    );
  }

  getSubCategories({required String parentCategoryId}) async{
    loading.show;
    listSubCategories =  await CategoriesController.getSubCategoriesForMainCategory(
        parentCategoryId: parentCategoryId
    );
    getSubCategoriesForMainCategoryModel.update(data:listSubCategories);
    loading.hide;
  }

  getSubCategoryDialog(String displayName){
    getSubCategoryCubit.loadData(listSubCategories.map((e) => Item(key: e.id, value: e.name, isOptional: e.isOptional)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainCategoryCubit,
      afterSelectItem: (Item item) {
      },
    );
  }


  getMainUnits()async{
    loading.show;
    List<MainUnitsModel>? unitsList = await UnitsController.getMainUnits();
    if(unitsList != null){
      getMainUnitsModel.update(data: unitsList);
    }
    loading.hide;
  }

  SelectItemsCubit getMainUnitsCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");

  getMainUnitsDialog(String displayName) {
    getMainUnitsCubit.loadData(getMainUnitsModel.state.data!.map((e) => Item(key: e.id, value: e.name)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainUnitsCubit,
      afterSelectItem: (Item item) {},
    );
  }

  selectImage() async {
    File? file = await uploadImage();
    if (file != null) {
      isImage.update(data: false);
      selectedImagePath.update(data: file);
      base64 = base64Encode(file.readAsBytesSync());
    }else{
      selectedImagePath.update(data: null);
    }
  }
}