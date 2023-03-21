import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/categories_model/categories_model.dart';

class AddCategoryViewModel{
TextEditingController mainCategoryName = TextEditingController();
Loading loading = Loading();
CategoriesModel categoriesModel = CategoriesModel();
late final Image image;
GenericCubit<String> selectedImagePath = GenericCubit(data: '');


addMainCategory({required String logo}) async{
    loading.show;
    CategoriesModel? categoriesModel = await CategoriesController.addMainCategory(
        name: mainCategoryName.text,
        companyId: globalData.companyId?? '',
        logo: logo);
    if (categoriesModel != null) {
      if (categoriesModel.state == true) {
        Get.snackbar('Success', categoriesModel.message![0].value.toString());
      } else {
        Get.snackbar('Error', categoriesModel.message![0].value.toString());
      }
    }
    loading.hide;
  }

selectImageFromGallery() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 10);
  if (file != null) {
    selectedImagePath.update(data: file.path);
  } else {
    return '';
  }
}
}