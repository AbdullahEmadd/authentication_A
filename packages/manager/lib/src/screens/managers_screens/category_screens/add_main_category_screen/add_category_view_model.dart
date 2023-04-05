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

import '../../manager_home_screen/home_view_model.dart';
import '../get_main_categories_screen/get_main_categories_view_model.dart';

class AddCategoryViewModel {
  String base64 ='';
  GlobalKey<FormState> addMainCategoryKey = GlobalKey<FormState>();
  TextEditingController mainCategoryName = TextEditingController();
  Loading loading = Loading();
  GenericCubit<File?> selectedImagePath = GenericCubit();
  GenericCubit<bool> isImage = GenericCubit(data: false);
  GenericCubit<bool> isOptional = GenericCubit(data: false);

  late HomeViewModel homeViewModel ;
  late GetMainCategoriesViewModel getMainCategoriesViewModel ;
  late dynamic object;

  initData(){
     object = Get.arguments ;
  }

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
      if (object is HomeViewModel) {
        homeViewModel = object;
        await homeViewModel.getMainCategories();
      } else {
        getMainCategoriesViewModel = object;
        await getMainCategoriesViewModel.getMainCategories();
        getMainCategoriesViewModel.homeViewModel.getMainCategoriesCubit.update(data: getMainCategoriesViewModel.mainCategory);
      }
      Get.snackbar('Success', "تم اضافه التصنيف بنجاح");
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
