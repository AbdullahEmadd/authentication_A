import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/categories_model/get_sub_category_additions_by_company_id_model.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';

class GetSubCategoriesViewModel {
  Loading loading = Loading();
  GenericCubit<List<SubCategoriesModel>> getSubCategoriesModel = GenericCubit<List<SubCategoriesModel>>(data: []);
  GenericCubit<List<GetSubCategoryAdditionsByCompanyIdModel>> getSubCategoryAdditionsByCompanyIdModel =
  GenericCubit<List<GetSubCategoryAdditionsByCompanyIdModel>>(data: []);

  getSubCategories () async{
    loading.show;
    getSubCategoriesModel.update(data: await CategoriesController.getSubCategories());
    loading.hide;
  }
}