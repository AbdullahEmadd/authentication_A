import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/helpers/image_picker.dart';
import 'package:manager/src/routes/routes.dart';

class AddCategoryViewModel {
  GlobalKey<FormState> addMainCategoryKey = GlobalKey<FormState>();
  GlobalKey<FormState> addSubCategoryKey = GlobalKey<FormState>();
  TextEditingController mainCategoryName = TextEditingController();
  TextEditingController subCategoryName = TextEditingController();
  Loading loading = Loading();
  GenericCubit<File?> selectedImagePath = GenericCubit();
  GenericCubit<bool> isImage = GenericCubit(data: false);
  String base64 ='';
  GenericCubit<bool> isOptional = GenericCubit(data: false);




  addMainCategory({required bool isOptional}) async {
    loading.show;
    bool? result =
        await CategoriesController.addMainCategory(
            name: mainCategoryName.text,
            companyId: globalData.companyId ?? '',
            logo: base64,
            isOptional: isOptional
        );
    if (result) {
        Get.snackbar('Success', "تم اضافه التصنيف بنجاح");
        globalData.getMainCategoriesViewModel.getMainCategories();
        goBack();
    }
    loading.hide;
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
