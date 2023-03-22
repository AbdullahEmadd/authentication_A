import 'package:get/get.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/categories_model/get_main_categories_model.dart';

class GetMainCategoriesViewModel {
  Loading loading = Loading();
  GenericCubit<List<MainCategoriesModel>>
   getMainCategoriesModel =GenericCubit<List<MainCategoriesModel>>(data: []);

  getMainCategories() async{
    loading.show;
      getMainCategoriesModel.update(data: await CategoriesController.getMainCategories(
      companyId: globalData.companyId!));
    loading.hide;
  }
}