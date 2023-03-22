import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/screens/managers_screens/get_categories_screens/get_main_categories_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_consts.dart';
import 'package:manager/src/utility/app_names.dart';

import '../../../cubits/generic_cubit/generic_cubit.dart';
import '../../../models/categories_model/get_main_categories_model.dart';

class GetMainCategoriesScreen extends StatefulWidget {
  @override
  State<GetMainCategoriesScreen> createState() =>
      _GetMainCategoriesScreenState();
}

class _GetMainCategoriesScreenState extends State<GetMainCategoriesScreen> {
  GetMainCategoriesViewModel getMainCategoriesViewModel =
      GetMainCategoriesViewModel();

  @override
  void initState() {
    getMainCategoriesViewModel.getMainCategories();
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
                text: AppNames.mainCategories,
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
          body: BlocBuilder<GenericCubit<List<MainCategoriesModel>>,
              GenericState<List<MainCategoriesModel>>>(
            bloc: getMainCategoriesViewModel.getMainCategoriesModel,
            builder: (context, state) {
              if (getMainCategoriesViewModel
                      .getMainCategoriesModel.state.data!.isEmpty &&
                  getMainCategoriesViewModel.loading.state.loading == true) {
                return SizedBox();
              } else {
                return ListView.builder(
                    itemCount: getMainCategoriesViewModel
                        .getMainCategoriesModel.state.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 82,
                          child: Card(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
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
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            20.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: getMainCategoriesViewModel
                                              .getMainCategoriesModel
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
                                  Container(
                                    height: 82,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              AppConsts.imageDomain +
                                                  getMainCategoriesViewModel
                                                      .getMainCategoriesModel
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
                                ]),
                          ),
                        ),
                      );
                    });
              }
            },
          ),
        ),
        Loader(loading: getMainCategoriesViewModel.loading),
      ],
    );
  }
}
