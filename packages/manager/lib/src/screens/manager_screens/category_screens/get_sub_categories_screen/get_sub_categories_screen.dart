import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_empty_data/custom_empty_data.dart';
import 'package:manager/src/components/custom_floating_action/custom_floating_action.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/manager_screens/category_screens/add_sub_category_screen/add_sub_category_screen.dart';
import 'package:manager/src/screens/manager_screens/category_screens/get_sub_categories_screen/get_sub_categories_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_consts.dart';
import 'package:manager/src/utility/app_names.dart';

class GetSubCategoriesScreen extends StatefulWidget {
  const GetSubCategoriesScreen({super.key});

  @override
  State<GetSubCategoriesScreen> createState() => _GetSubCategoriesScreenState();
}

class _GetSubCategoriesScreenState extends State<GetSubCategoriesScreen> {
  GetSubCategoriesViewModel getSubCategoriesViewModel = GetSubCategoriesViewModel();
  @override
  void initState() {

    getSubCategoriesViewModel.initialize();
    getSubCategoriesViewModel.initData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(textAppBar: AppNames.subCategories,),
          body: BlocBuilder<GenericCubit<List<SubCategoriesModel>>,
              GenericState<List<SubCategoriesModel>>>(
            bloc: getSubCategoriesViewModel.getSubCategoriesForMainCategoryModel,
            builder: (context, state) {
              if (state is GenericUpdate) {
                return state.data!.isNotEmpty? ListView.builder(
                  itemCount: getSubCategoriesViewModel
                      .getSubCategoriesForMainCategoryModel.state.data!.length,
                  itemBuilder: (context, index) {
                    return
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          height: 82.h,
                          child: Card(
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 82,
                                    width:
                                    MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              AppConsts.imageDomain +
                                                  getSubCategoriesViewModel
                                                      .getSubCategoriesForMainCategoryModel
                                                      .state
                                                      .data![index]
                                                      .logo!)),
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                      color: AppColors.gray,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 3 -
                                        20.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: getSubCategoriesViewModel
                                              .getSubCategoriesForMainCategoryModel
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
                                        CustomText(
                                          text: '5 قطع',
                                          textAlign: TextAlign.end,
                                          fontSize: 11.sp,
                                          color: AppColors.mainColor,
                                          fontWeight: FontWeight.bold,
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
                        ),
                      ),
                    );
                  }):
              const CustomEmptyData();
              } else {
                return Container();
              }
            },
          ),
          floatingActionButton: CustomFloatingAction(
              onPressed: () {
                goToScreen(screenNames: ScreenNames.addSubCategoryScreen,
                    arguments: AddSubCategoryScreen(
                      isOptional: getSubCategoriesViewModel.isOptional ?? false,
                      getSubCategoriesViewModel:
                      getSubCategoriesViewModel,
                      subCategoryId: getSubCategoriesViewModel.parentId,
                    ));
              }),
        ),
        Loader(loading: getSubCategoriesViewModel.loading)
      ],
    );
  }
}
