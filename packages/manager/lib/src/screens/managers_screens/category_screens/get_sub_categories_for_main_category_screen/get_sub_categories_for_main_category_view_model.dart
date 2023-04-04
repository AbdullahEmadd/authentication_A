import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';

class GetSubCategoriesForMainCategoryViewModel{
  Loading loading = Loading();
  GenericCubit<List<SubCategoriesModel>> getSubCategoriesForMainCategoryModel =
  GenericCubit<List<SubCategoriesModel>>(data: []);

  getSubCategoriesForMainCategory({required String parentCategoryId}) async{
    loading.show;
    getSubCategoriesForMainCategoryModel.update(data: await CategoriesController.getSubCategoriesForMainCategory(
      parentCategoryId: parentCategoryId
    ));
    loading.hide;
  }
}