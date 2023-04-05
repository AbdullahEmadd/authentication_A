import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/manager_drawer/manager_drawer.dart';
import 'package:manager/src/utility/app_names.dart';
import '../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../cubits/generic_cubit/generic_cubit.dart';
import '../../../models/categories_model/main_categories_model.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_fonts.dart';
import 'components/category_item.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    homeViewModel.getMainCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(textAppBar: AppNames.home , isPageHome: true),
          drawer: const ManagerDrawerScreen(),
          body: Container(
            padding: EdgeInsets.all(20.sp),
            child: BlocBuilder<GenericCubit<List<MainCategoriesModel>>, GenericState<List<MainCategoriesModel>>>(
              bloc: homeViewModel.getMainCategoriesCubit,
              builder: (context, state) {
                if(state is GenericUpdate) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: AppNames.mainCategories,
                              color: AppColors.black,
                              fontSize: 16.sp,
                              fontFamily: AppFonts.fontMedium),

                          InkWell(
                            onTap: (){
                              goToScreen(screenNames: ScreenNames.getMainCategoriesScreen , arguments: homeViewModel);
                            },
                            child: Row(
                              children: [
                                CustomText(
                                    text:  AppNames.all,
                                    color: AppColors.mainColor,
                                    fontSize: 16.sp,
                                    fontFamily: AppFonts.fontMedium),
                                CustomText(
                                    text: state.data!.length > 6
                                        ? "(${state.data!.length.toString()})"
                                        : "",
                                    color: AppColors.mainColor,
                                    fontSize: 12.sp,
                                    fontFamily: AppFonts.fontMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                      state.data!.isNotEmpty
                          ? Expanded(
                        child: GridView.builder(
                                  itemCount: state.data!.length >= 6
                                      ? 6
                                      : state.data!.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 6.0,
                              mainAxisSpacing: 6.0,
                              childAspectRatio: 1.8 / 1,
                            ),
                            itemBuilder: (context, index) {
                              return  CategoryItem(mainCategoriesModel: state.data![index],);
                            }
                        ),
                      )
                          : SizedBox(
                            height: 0.25.sh,
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  goToScreen(screenNames: ScreenNames.addCategoryScreen , arguments: homeViewModel);
                                },
                                child: CustomText(
                                    text: AppNames.notFoundMainCategory,
                                    color: AppColors.black.withOpacity(.5),
                                    fontSize: 14.sp,
                                    textAlign: TextAlign.center,
                                    fontFamily: AppFonts.fontMedium),
                              ),
                            ),
                          ),
                    ],
                  );
                }
                else {
                  return Container();
                }
              },
            ),
          ),
        ),
        Loader(loading: homeViewModel.loading)
      ],
    );
  }
}
