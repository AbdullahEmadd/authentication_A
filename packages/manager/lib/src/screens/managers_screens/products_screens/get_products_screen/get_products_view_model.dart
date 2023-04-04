import 'package:manager/src/controller/products_request/products_request.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/cubits/loading_cubit/loading_cubit.dart';
import 'package:manager/src/models/products_model/products_model.dart';

class GetProductsViewModel{
  Loading loading = Loading();
  GenericCubit<List<ProductsModel>> getProductsModel =
    GenericCubit<List<ProductsModel>>(data: []);

  getProducts() async{
    loading.show;
    getProductsModel.update(
        data: await ProductsController.getProducts());
    loading.hide;
  }
}