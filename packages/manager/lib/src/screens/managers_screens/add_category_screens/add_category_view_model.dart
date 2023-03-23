import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/helpers/select_image_from_gallery.dart';
import 'package:manager/src/models/categories_model/add_categories_model.dart';

class AddCategoryViewModel {
  GlobalKey<FormState> addMainCategoryKey = GlobalKey<FormState>();
  GlobalKey<FormState> addSubCategoryKey = GlobalKey<FormState>();
  TextEditingController mainCategoryName = TextEditingController();
  TextEditingController subCategoryName = TextEditingController();
  Loading loading = Loading();
  AddCategoriesModel addCategoriesModel = AddCategoriesModel();
  GenericCubit<String> selectedImagePath = GenericCubit(data: '');
  GenericCubit<bool> isImage = GenericCubit(data: false);
  String base64 ='';

  addMainCategory() async {
    loading.show;
    AddCategoriesModel? addCategoriesModel =
        await CategoriesController.addMainCategory(
            name: mainCategoryName.text,
            companyId: globalData.companyId ?? '',
            logo: base64);
    if (addCategoriesModel != null) {
      if (addCategoriesModel.state == true) {
        Get.snackbar('Success', addCategoriesModel.message![0].value.toString());
      } else {
        Get.snackbar('Error', addCategoriesModel.message![0].value.toString());
      }
    }
    loading.hide;
  }

  addSubCategory() async {
    loading.show;
    AddCategoriesModel? addCategoriesModel =
    await CategoriesController.addSubCategory(
        name: subCategoryName.text,
        companyId: globalData.companyId ?? '',
        logo: base64,
        parentCompanyId: '1905b126-224c-48f4-9e95-5712d2067cd1');
    if (addCategoriesModel != null) {
      if (addCategoriesModel.state == true) {
        Get.snackbar('Success', addCategoriesModel.message![0].value.toString());
      } else {
        Get.snackbar('Error', addCategoriesModel.message![0].value.toString());
      }
    }
    loading.hide;
  }

  selectImageFromGallery() async {
    XFile? xFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (xFile != null) {
      selectedImagePath.update(data: xFile.path);
      base64 = base64Encode(File(xFile.path).readAsBytesSync());
    }else{
      return 'Image not selected';
    }
  }
}
