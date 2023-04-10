import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';

import '../../../controller/categories_request/categories_request.dart';
import '../../../cubits/generic_cubit/generic_cubit.dart';
import '../../../models/categories_model/main_categories_model.dart';

class HomeViewModel{
  Loading loading = Loading();
  GenericCubit<List<MainCategoriesModel>> getMainCategoriesCubit = GenericCubit(data: []);

  getMainCategories() async {
    loading.show;
    List<MainCategoriesModel> mainCategory = await CategoriesController.getMainCategories();
    getMainCategoriesCubit.update(data:mainCategory);
    loading.hide;
  }
}