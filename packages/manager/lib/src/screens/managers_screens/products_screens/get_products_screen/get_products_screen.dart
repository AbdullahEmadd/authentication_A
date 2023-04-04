import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/models/products_model/products_model.dart';
import 'package:manager/src/screens/managers_screens/products_screens/get_products_screen/get_products_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class GetProductsScreen extends StatefulWidget {

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
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
                text: AppNames.products,
                fontSize: 16.sp,
                color: AppColors.black,
                fontWeight: FontWeight.bold),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                  iconSize: 35,
                ),
              ),
            ],
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                      ),
                                    )),
                                Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                      ),
                                    )),
                              ],
                            ),
                          ]),
                    ),
                  );
                },
              );
            },
          )
        ),
        Loader(loading: getProductsViewModel.loading)
      ],
    );
  }
}
