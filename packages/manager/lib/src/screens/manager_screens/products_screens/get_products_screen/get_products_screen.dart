import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_floating_action/custom_floating_action.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/helpers/global_helper.dart';
import 'package:manager/src/models/products_model/products_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/manager_screens/products_screens/get_products_screen/get_products_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_consts.dart';
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
    globalData.getProductsViewModel = getProductsViewModel;
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
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      height: 82.h,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getProductsViewModel.getProductsModel.state.data![index].prodImages!.isNotEmpty?
                            Container(
                              height: 82,
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      AppConsts.imageDomain+ getProductsViewModel
                                      .getProductsModel
                                      .state
                                      .data![index].prodImages![0].url!
                                  ),),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                                color: AppColors.gray,
                              ),
                            ): Container(width: MediaQuery.of(context).size.width / 3,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Name: ${getProductsViewModel
                                      .getProductsModel
                                      .state
                                      .data![index]
                                      .name!}',
                                  maxLines: 2,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                getProductsViewModel
                                    .getProductsModel
                                    .state
                                    .data![index]
                                    .description != null ?
                                CustomText(
                                  text: 'Description: ${getProductsViewModel
                                      .getProductsModel
                                      .state
                                      .data![index]
                                      .description!}',
                                  maxLines: 2,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ): Container(),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
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
