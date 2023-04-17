import 'package:manager/src/components/custom_alert_select_item.dart';
import 'package:manager/src/controller/categories_request/categories_request.dart';
import 'package:manager/src/controller/products_request/products_request.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/cubits/select_items_cubit/selectitems_cubit.dart';
import 'package:manager/src/models/categories_model/main_categories_model.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';
import 'package:manager/src/models/items_model/items.dart';
import 'package:manager/src/models/products_model/stock_products_model.dart';

class StoreViewModel {
  Loading loading = Loading();
  SelectItemsCubit getProductsCubit = SelectItemsCubit(
      errorText: "هذا الحقل مطلوب");
  SelectItemsCubit getMainCategoryCubit = SelectItemsCubit(
      errorText: "هذا الحقل مطلوب");
  SelectItemsCubit getSubCategoryCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");
  List<StockProductsModel> listProducts = [];
  List<MainCategoriesModel> listMainCategory = [];
  List<SubCategoriesModel> listSubCategories = [];
  SelectItemsCubit quantityItemsCubit = SelectItemsCubit(errorText: "هذا الحقل مطلوب");
  List<StockProductsModel> quantityItems = [];
  
  quantityItemsDialog(String displayName){
    quantityItemsCubit.loadData(quantityItems.map((e) => Item(key: "1", value: e.unitVM!.name)).toList());
  }

  initialize()  {
    getMainCategories();
  }

  getMainCategories() async {
    loading.show;
    listMainCategory = await CategoriesController.getMainCategories();
    loading.hide;
  }

  getMainCategoryDialog(String displayName) {
    getMainCategoryCubit.loadData(listMainCategory.map((e) => Item(key: e.id, value: e.name , isOptional: e.isOptional)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getMainCategoryCubit,
      afterSelectItem: (Item item) {
        getSubCategories(parentCategoryId:
        getMainCategoryCubit.state.selectedItems!.key!);
      },
    );
  }

  getSubCategories({required String parentCategoryId}) async{
    loading.show;
    listSubCategories =  await CategoriesController.getSubCategoriesForMainCategory(
        parentCategoryId: parentCategoryId
    );
    loading.hide;
  }

  getSubCategoryDialog(String displayName){
    getSubCategoryCubit.loadData(listSubCategories.map((e) => Item(key: e.id, value: e.name, isOptional: e.isOptional)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getSubCategoryCubit,
      afterSelectItem: (Item item) {
        getProducts();
      },
    );
  }

  getProducts() async{
    loading.show;
    listProducts = await ProductsController.getProductsByCategoryIdAndSubCategoryId(
        categoryId: getMainCategoryCubit.state.selectedItems!.key!,
        subCategoryId: getSubCategoryCubit.state.selectedItems!.key!);
    loading.hide;
  }

  getProductsDialog(String displayName){
    getProductsCubit.loadData(listProducts.map((e) => Item(key: e.unitVM!.quantityPerUnitGroup.toString(), value: e.productVM!.name)).toList());
    CustomAlertSelectItems.customSelectItems(
      displayName: displayName,
      selectItemsCubit: getProductsCubit,
      afterSelectItem: (Item item) {
        var quantityPerUnitGroup = getProductsCubit.state.selectedItems!.key;
      },
    );
  }
}