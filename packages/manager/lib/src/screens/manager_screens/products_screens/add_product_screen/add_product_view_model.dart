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
import 'package:manager/src/models/sub_units_model/sub_units_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/manager_screens/products_screens/get_products_screen/get_products_view_model.dart';
import '../../../../cubits/loading_cubit/loading_cubit.dart';
import '../../../../models/items_model/items.dart';

class AddProductViewModel {
  GetProductsViewModel getProductsViewModel = GetProductsViewModel();
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
  GenericCubit<bool> isOptional = GenericCubit(data: false);

  initialize()  {
    getMainCategories();
    getMainUnits();
  }

  addProduct() async {
    loading.show;
    bool? result = await ProductsController.addProduct(
        name: productName.text,
        description: productDescription.text,
        categoryId: getMainCategoryCubit.state
            .selectedItems!.key.toString(),
        subCategoryId: getSubCategoryCubit.state.selectedItems!.key.toString(),
        mainUnitId: getMainUnitsCubit.state.selectedItems!.key.toString(),
        companyId: globalData.companyId!,
        isOptional: isOptional.state.data!,
        image: base64,
    );
    if (result) {
      globalData.getProductsViewModel.getProducts();
      getMessageSnackBar(messageText: "تم اضافه المنتج بنجاح");
      goBack();
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
    loading.hide;
  }

  getSubCategoryDialog(String displayName){
    getSubCategoryCubit.loadData(listSubCategories.map((e) => Item(key: e.id, value: e.name, isOptional: e.isOptional)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getSubCategoryCubit,
      afterSelectItem: (Item item) {
      },
    );
  }

  getMainUnits() async{
    loading.show;
    List<MainUnitsModel>? unitsList = await UnitsController.getMainUnits();
    getMainUnitsModel.update(data: unitsList);
    loading.hide;
  }

  SelectItemsCubit getMainUnitsCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");

  getMainUnitsDialog(String displayName) {
    getMainUnitsCubit.loadData(getMainUnitsModel.state.data!.map((e) => Item(key: e.id, value: e.name)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainUnitsCubit,
      afterSelectItem: (Item item) {
        getSubUnits(unitGroupId: getMainUnitsCubit.state.selectedItems!.key!);
      },
    );
  }
  GenericCubit<List<SubUnitsModel>> getSubUnitsModel = GenericCubit<List<SubUnitsModel>>(data: []);
  SelectItemsCubit getSubUnitsCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");

  getSubUnits({required String unitGroupId}) async {
    loading.show;
    getSubUnitsModel.update(data: await UnitsController.getSubUnits(
        unitGroupId: unitGroupId
    ));
    loading.hide;
  }

  getSubUnitsDialog (String displayName) {
    getSubUnitsCubit.loadData(getSubUnitsModel.state.data!.map((e) => Item(key: e.id, value: e.name)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getSubUnitsCubit,
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