import 'package:get/get.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';

import '../../../../models/categories_model/get_sub_category_additions_by_company_id_model.dart';

class GetSubCategoriesForMainCategoryViewModel{

  List<dynamic>? items;
  String parentId = '';
  bool? isOptional;
  Loading loading = Loading();
  List<SubCategoriesModel> listSubCategories = [];
  List<GetSubCategoryAdditionsByCompanyIdModel> listAdditionsSubCategory = [];
  GenericCubit<List<SubCategoriesModel>> getSubCategoriesForMainCategoryModel =
  GenericCubit<List<SubCategoriesModel>>(data: []);


  void initialize() {
    items = Get.arguments;
    parentId = items![0];
    isOptional = items![1] ?? false;
  }

  initData() async {
      await getSubCategoriesForMainCategory(parentCategoryId: parentId);
  }

  getSubCategoriesForMainCategory({required String parentCategoryId}) async{
    loading.show;
    listSubCategories =  await CategoriesController.getSubCategoriesForMainCategory(
        parentCategoryId: parentCategoryId
    );
    getSubCategoriesForMainCategoryModel.update(data:listSubCategories);
    loading.hide;
  }
}