import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/categories_model/categories_model.dart';



class AddCategoryViewModel{

TextEditingController mainCategoryName = TextEditingController();
Loading loading = Loading();
CategoriesModel categoriesModel = CategoriesModel();
late final Image image;


  addMainCategory() async{
    loading.show;
    CategoriesModel? categoriesModel = await CategoriesController.addMainCategory(
        name: mainCategoryName.text,
        companyId: '',
        logo: '');
    if (CategoriesModel != null) {
      Get.snackbar('Success', categoriesModel!.message![0].value.toString());
    }
    loading.hide;
  }
}