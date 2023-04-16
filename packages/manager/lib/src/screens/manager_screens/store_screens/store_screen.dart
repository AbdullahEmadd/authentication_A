import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_select_item/custom_select_item_list.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/screens/manager_screens/store_screens/store_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_fonts.dart';
import 'package:manager/src/utility/app_names.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  StoreViewModel storeViewModel = StoreViewModel();
  @override
  void initState() {
    storeViewModel.initialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: CustomAppBar(
                  textAppBar: AppNames.stock,
                  tabBar: TabBar(
                      labelColor: AppColors.mainColor,
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.fontMedium,
                      ),
                      unselectedLabelColor: const Color(0xffA3A3A3),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14.sp, fontFamily: AppFonts.fontMedium),
                      indicatorColor: AppColors.mainColor,
                      tabs: const [
                        Tab(text: AppNames.companyStore),
                        Tab(text: AppNames.employeeStore),
                      ])),
              body: TabBarView(
                  children: [
                SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                        children: [
                      SizedBox(height: 30.h),
                          SelectItemList(
                              name: AppNames.mainCategoryName,
                              onTap: storeViewModel.getMainCategoryDialog,
                              selectItemsCubitTemp: storeViewModel.getMainCategoryCubit),
                          SizedBox(height: 12.h),
                          SelectItemList(
                              name: AppNames.subCategoryName,
                              onTap: storeViewModel.getSubCategoryDialog,
                              selectItemsCubitTemp: storeViewModel.getSubCategoryCubit),
                          SizedBox(height: 12.h,),
                          SelectItemList(
                            name: AppNames.productName,
                            onTap: storeViewModel.getProductsDialog,
                            selectItemsCubitTemp: storeViewModel.getProductsCubit,
                          ),
                          SizedBox(height: 7.h,),
                          CustomTextField(
                            textFieldValidatorType: null,
                            hint: AppNames.amount,
                            width: 165.w,
                          ),
                          CustomTextField(
                        textFieldValidatorType: null, //To be edited
                        hint: AppNames.amountForProduct,
                      ),
                      SizedBox(height: 25.h),
                      CustomButton(
                        text: AppNames.editAmount,
                        function: () {},
                      )
                    ]),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        SelectItemList(
                            name: AppNames.mainCategoryName,
                            onTap: storeViewModel.getMainCategoryDialog,
                            selectItemsCubitTemp: storeViewModel.getMainCategoryCubit),
                        SizedBox(height: 12.h),
                        SelectItemList(
                            name: AppNames.subCategoryName,
                            onTap: storeViewModel.getSubCategoryDialog,
                            selectItemsCubitTemp: storeViewModel.getSubCategoryCubit),
                        SizedBox(height: 12.h,),
                        SelectItemList(
                          name: AppNames.productName,
                          onTap: storeViewModel.getProductsDialog,
                          selectItemsCubitTemp: storeViewModel.getProductsCubit,
                        ),
                        SizedBox(height: 7.h,),
                        CustomTextField(
                          textFieldValidatorType: null,
                          hint: AppNames.amount,
                          width: 165.w,
                        ),
                        SizedBox(height: 7.h),
                        CustomTextField(
                          textFieldValidatorType: null,
                          hint: AppNames.subCategoryNumber,
                          width: 165.w,
                        ),
                        CustomTextField(
                          textFieldValidatorType: null,
                          hint: AppNames.numberOfUnits
                        ),
                        SizedBox(height: 25.h),
                        CustomButton(
                          text: AppNames.transferToEmployee,
                          function: (){},
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )),
        Loader(loading: storeViewModel.loading)
      ],
    );
  }
}
