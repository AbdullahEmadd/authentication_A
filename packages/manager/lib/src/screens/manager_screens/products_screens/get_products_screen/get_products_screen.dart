import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_floating_action/custom_floating_action.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/models/products_model/products_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/manager_screens/products_screens/get_products_screen/get_products_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class GetProductsScreen extends StatefulWidget {
  const GetProductsScreen({super.key});


  @override
  State<GetProductsScreen> createState() => _GetProductsScreenState();
}

class _GetProductsScreenState extends State<GetProductsScreen> {
  GetProductsViewModel getProductsViewModel = GetProductsViewModel();

  @override
  void initState() {
    getProductsViewModel.getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            textAppBar: AppNames.products,
          ),
          body: BlocBuilder<GenericCubit<List<ProductsModel>>,
          GenericState<List<ProductsModel>>>(
            bloc: getProductsViewModel.getProductsModel,
            builder: (context, state) {
              return ListView.builder(
                itemCount: getProductsViewModel.getProductsModel.state.data!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 82.h,
                    child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3 -
                                  20.w,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: getProductsViewModel
                                        .getProductsModel
                                        .state
                                        .data![index]
                                        .name!,
                                    maxLines: 2,
                                    fontSize: 11.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              );
            },
          ),
          floatingActionButton: CustomFloatingAction(
              onPressed: () {
                goToScreen(screenNames: ScreenNames.addProductScreen);
              }),
        ),
        Loader(loading: getProductsViewModel.loading)
      ],
    );
  }
}
