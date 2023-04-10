import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_floating_action/custom_floating_action.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/models/categories_model/main_categories_model.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/category_screens/get_main_categories_screen/get_main_categories_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_consts.dart';
import 'package:manager/src/utility/app_images.dart';
import 'package:manager/src/utility/app_names.dart';
import '../../../../components/custom_app_bar/custom_app_bar.dart';

class GetMainCategoriesScreen extends StatefulWidget {
  const GetMainCategoriesScreen({super.key});

  @override
  State<GetMainCategoriesScreen> createState() =>
      _GetMainCategoriesScreenState();
}

class _GetMainCategoriesScreenState extends State<GetMainCategoriesScreen> {
  GetMainCategoriesViewModel getMainCategoriesViewModel = GetMainCategoriesViewModel();


  @override
  void initState() {
    getMainCategoriesViewModel.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(textAppBar: AppNames.mainCategories),
          body: BlocBuilder<GenericCubit<List<MainCategoriesModel>>,
              GenericState<List<MainCategoriesModel>>>(
            bloc: getMainCategoriesViewModel.getMainCategoriesModel,
            builder: (context, state) {
              return state.data!.isNotEmpty ?ListView.builder(
                  itemCount: getMainCategoriesViewModel
                      .getMainCategoriesModel.state.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        String parentId = getMainCategoriesViewModel
                            .getMainCategoriesModel.state.data![index].id!;
                        bool? isOptional = getMainCategoriesViewModel.getMainCategoriesModel.state.data![index].isOptional;
                        goToScreen(
                            screenNames: ScreenNames
                                .getSubCategoriesScreen,
                            arguments: [parentId, isOptional]);
                      },
                      child: SizedBox(
                        height: 82.h,
                        child: Card(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 82,
                                  width: MediaQuery.of(context).size.width / 3,
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3 -
                                      20.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                  }):
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.isEmpty, package: 'manager'),
                    SizedBox(height: 10.h),
                    CustomText(
                        text: 'عفوا.. لا يوجد بيانات حاليا',
                        fontSize: 15.sp),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: CustomFloatingAction(
              onPressed: () {
                goToScreen(screenNames: ScreenNames.addCategoryScreen , arguments: getMainCategoriesViewModel);
              }),
        ),
        Loader(loading: getMainCategoriesViewModel.loading),
      ],
    );
  }
}
