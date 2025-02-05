import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/src/components/custom_alert_select_item.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/cubits/select_items_cubit/selectitems_cubit.dart';
import 'package:manager/src/helpers/get_message_snackbar.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/helpers/image_picker.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/manager_screens/category_screens/get_sub_categories_screen/get_sub_categories_view_model.dart';
import '../../../../helpers/custom_select_item_validator.dart';
import '../../../../models/categories_model/get_sub_category_additions_by_company_id_model.dart';
import '../../../../models/categories_model/main_categories_model.dart';
import '../../../../models/items_model/items.dart';
import 'add_sub_category_screen.dart';

AddSubCategoryViewModel addSubCategoryViewModel = AddSubCategoryViewModel();
class AddSubCategoryViewModel {
  String base64 ='';
  Loading loading = Loading();
  late AddSubCategoryScreen addSubCategoryScreen ;
  GlobalKey<FormState> addSubCategoryKey = GlobalKey<FormState>();
  TextEditingController subCategoryName = TextEditingController();
  GenericCubit<File?> selectedImagePath = GenericCubit();
  GenericCubit<bool> isImage = GenericCubit(data: false);
  GenericCubit<bool> showAdditionsCategory = GenericCubit(data: false);
  List<MainCategoriesModel> listMainCategory = [];
  List<GetSubCategoryAdditionsByCompanyIdModel> listAdditionsSubCategory = [];
  SelectItemsCubit getMainCategoryCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");
  SelectItemsCubit getAdditionsCategoryCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");
  GetSubCategoriesViewModel getSubCategoriesViewModel = GetSubCategoriesViewModel();


  initData()async{
    addSubCategoryScreen = Get.arguments;
    showAdditionsCategory.update(data: addSubCategoryScreen.isOptional ?? false);
    await getMainCategories();
    await getSubCategoryAdditionsByCompanyId();
  }

  getMainCategories() async {
    loading.show;
    listMainCategory = await CategoriesController.getMainCategories();
    for (MainCategoriesModel element in listMainCategory) {
      if(element.id == addSubCategoryScreen.getSubCategoriesViewModel!.parentId){
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
    loading.hide;
  }

  getMainCategoryDialog(String displayName) {
    getMainCategoryCubit.loadData(listMainCategory.map((e) => Item(key: e.id, value: e.name , isOptional: e.isOptional)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainCategoryCubit,
      afterSelectItem: (Item item) {
        showAdditionsCategory.update(data: item.isOptional ?? false);
      },
    );
  }

  getAdditionsCategoryDialog(String displayName) {
    getAdditionsCategoryCubit.loadData(listAdditionsSubCategory.map((e) => Item(key: e.id, value: e.name , isOptional: e.isOptional)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getAdditionsCategoryCubit,
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
          isOptional: showAdditionsCategory.state.data ?? false,
          parentCategoryId: getMainCategoryCubit.state.selectedItems!.key.toString(),
          relatedCategoryId: getAdditionsCategoryCubit.state.selectedItems != null
              ? getAdditionsCategoryCubit.state.selectedItems!.key.toString()
              : null
      );
      if (result) {
        await addSubCategoryScreen.getSubCategoriesViewModel!.initData();
        getMessageSnackBar(messageText: "تم اضافه التصنيف بنجاح");
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
