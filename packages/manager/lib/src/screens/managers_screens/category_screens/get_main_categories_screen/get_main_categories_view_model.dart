import 'package:get/get.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/categories_model/main_categories_model.dart';
import 'package:manager/src/screens/managers_screens/manager_home_screen/home_view_model.dart';

class GetMainCategoriesViewModel {

  List<MainCategoriesModel> mainCategory = [];
  late HomeViewModel homeViewModel;
  Loading loading = Loading();
  GenericCubit<List<MainCategoriesModel>> getMainCategoriesModel = GenericCubit<List<MainCategoriesModel>>(data: []);

  initData() async {
    homeViewModel = Get.arguments;
    await getMainCategories();
  }

  getMainCategories() async {
    loading.show;
    mainCategory = await CategoriesController.getMainCategories();
    getMainCategoriesModel.update(data: mainCategory);
    loading.hide;
  }
}
