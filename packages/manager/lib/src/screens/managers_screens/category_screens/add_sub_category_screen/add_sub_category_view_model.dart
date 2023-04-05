import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/src/components/custom_alert_select_item.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/cubits/select_items_cubit/selectitems_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/helpers/image_picker.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/category_screens/get_sub_categories_for_main_category_screen/get_sub_categories_for_main_category_view_model.dart';
import '../../../../helpers/custom_select_item_validator.dart';
import '../../../../models/categories_model/get_sub_category_additions_by_company_id_model.dart';
import '../../../../models/categories_model/main_categories_model.dart';
import '../../../../models/items.dart';
import 'add_sub_category_screen.dart';

class AddSubCategoryViewModel {
  String base64 ='';
  Loading loading = Loading();
  late AddSubCategoryScreen addSubCategoryScreen ;
  GlobalKey<FormState> addSubCategoryKey = GlobalKey<FormState>();
  TextEditingController subCategoryName = TextEditingController();
  GenericCubit<File?> selectedImagePath = GenericCubit();
  GenericCubit<bool> isImage = GenericCubit(data: false);
  List<MainCategoriesModel> listMainCategory = [];
  List<GetSubCategoryAdditionsByCompanyIdModel> listAdditionsSubCategory = [];
  SelectItemsCubit getMainCategoryCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");
  GetSubCategoriesForMainCategoryViewModel getSubCategoriesForMainCategoryViewModel = GetSubCategoriesForMainCategoryViewModel();


  initData()async{
    addSubCategoryScreen = Get.arguments;
    if(addSubCategoryScreen.isOptional!){
      getSubCategoryAdditionsByCompanyId();
    }else{
      await getMainCategories();
    }
  }

  getMainCategories() async {
    loading.show;
    listMainCategory = await CategoriesController.getMainCategories();
    for (MainCategoriesModel element in listMainCategory) {
      if(element.id == addSubCategoryScreen.getSubCategoriesForMainCategoryViewModel!.parentId){
        getMainCategoryCubit.selectItems(Item(key: element.id , value: element.name));
        loading.hide;
        return;
      }
    }
    loading.hide;
  }

  getSubCategoryAdditionsByCompanyId () async {
    loading.show;
    listAdditionsSubCategory = await CategoriesController.getSubCategoryAdditionsByCompanyId();
    for (GetSubCategoryAdditionsByCompanyIdModel element in listAdditionsSubCategory) {
      if(element.id == addSubCategoryScreen.getSubCategoriesForMainCategoryViewModel!.parentId){
        getMainCategoryCubit.selectItems(Item(key: element.id , value: element.name));
        loading.hide;
        return;
      }
    }
    loading.hide;
  }

  getCategoryDialog(String displayName) {
    List<Item> items =[];
    if(addSubCategoryScreen.isOptional!){
      items = listAdditionsSubCategory.map((e) => Item(key: e.id, value: e.name)).toList();
    }else{
     items = listMainCategory.map((e) => Item(key: e.id, value: e.name)).toList();
    }
    getMainCategoryCubit.loadData(items);

    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainCategoryCubit,
      afterSelectItem: (Item item) {
      },
    );
  }

  addSubCategory() async {

    bool result = addSubCategoryKey.currentState!.validate();
    bool getMainCategoryValidation = SelectItemValidator.validationFunction(selectItemsCubitList: [getMainCategoryCubit]);

    if (result && getMainCategoryValidation && selectedImagePath.state.data != null) {
      loading.show;
      bool? result =
      await CategoriesController.addSubCategory(
          name: subCategoryName.text,
          companyId: globalData.companyId ?? '',
          logo: base64,
          isOptional: addSubCategoryScreen.isOptional!,
          categoryId: getMainCategoryCubit.state.selectedItems!.key.toString());
      if (result) {
        await addSubCategoryScreen.getSubCategoriesForMainCategoryViewModel!.initData();
        Get.snackbar('Success', addSubCategoryScreen.isOptional!
            ? "تم اضافه الاضافات بنجاح"
            : "تم اضافه التصنيف بنجاح");
        goBack();
      }
      loading.hide;
    } else {
      if (selectedImagePath.state.data == null) {
        isImage.update(data: true);
      }
    }
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
