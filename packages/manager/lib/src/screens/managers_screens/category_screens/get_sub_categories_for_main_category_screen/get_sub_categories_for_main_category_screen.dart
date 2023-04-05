import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/models/categories_model/sub_categories_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/category_screens/get_sub_categories_for_main_category_screen/get_sub_categories_for_main_category_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_consts.dart';
import 'package:manager/src/utility/app_names.dart';

class GetSubCategoriesForMainCategoryScreen extends StatefulWidget {

  @override
  State<GetSubCategoriesForMainCategoryScreen> createState() => _GetSubCategoriesForMainCategoryScreenState();
}

class _GetSubCategoriesForMainCategoryScreenState extends State<GetSubCategoriesForMainCategoryScreen> {
  GetSubCategoriesForMainCategoryViewModel getSubCategoriesForMainCategoryViewModel = GetSubCategoriesForMainCategoryViewModel();
  List<dynamic>? x;
  String parentId = '';
  bool? isOptional;

  @override
  void initState() {
    x = Get.arguments;
    parentId = x![0];
    isOptional = x![1];
    getSubCategoriesForMainCategoryViewModel.getSubCategoriesForMainCategory(
        parentCategoryId: parentId);
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
                text: AppNames.subCategories,
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
          body: BlocBuilder<GenericCubit<List<SubCategoriesModel>>,
              GenericState<List<SubCategoriesModel>>>(
            bloc: getSubCategoriesForMainCategoryViewModel.getSubCategoriesForMainCategoryModel,
            builder: (context, state) {
              return ListView.builder(
                  itemCount: getSubCategoriesForMainCategoryViewModel
                      .getSubCategoriesForMainCategoryModel.state.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                      },
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
                                                getSubCategoriesForMainCategoryViewModel
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
                                        text: getSubCategoriesForMainCategoryViewModel
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
                    );
                  });
            },
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.mainColor,
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                goToScreen(screenNames: ScreenNames.addSubCategoryScreen,
                arguments: isOptional);
              }),
        ),
        Loader(loading: getSubCategoriesForMainCategoryViewModel.loading)
      ],
    );
  }
}
