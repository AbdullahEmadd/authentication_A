import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_select_item/custom_select_item_list.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/utility/app_fonts.dart';
import 'package:manager/src/utility/app_names.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
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
                      labelColor: const Color(0xffFF7642),
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.fontMedium,
                      ),
                      unselectedLabelColor: const Color(0xffA3A3A3),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14.sp, fontFamily: AppFonts.fontMedium),
                      indicatorColor: const Color(0xffFF7642),
                      tabs: const [
                        Tab(text: AppNames.companyStore),
                        Tab(text: AppNames.employeeStore),
                      ])),
              body: TabBarView(children: [
                Column(children: [
                  SizedBox(height: 12.h),
                  // SelectItemList(
                  //     name: AppNames.mainCategoryName,
                  //     onTap: onTap,
                  //     selectItemsCubitTemp: selectItemsCubitTemp),
                  // SizedBox(height: 12.h),
                  // SelectItemList(
                  //       name: AppNames.subCategoryName,
                  //       onTap: onTap,
                  //       selectItemsCubitTemp: selectItemsCubitTemp),
                  // SizedBox(height: 12.h),
                  // SelectItemList(
                  //       name: AppNames.productName, onTap: onTap, selectItemsCubitTemp: selectItemsCubitTemp),
                  // SizedBox(height: 12.h),
                  // SelectItemList(
                  //       name: AppNames.amount, onTap: onTap, selectItemsCubitTemp: selectItemsCubitTemp),
                  SizedBox(height: 12.h),
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
                Column(
                  children: [
                    // SelectItemList(
                    //     name: AppNames.mainCategoryName,
                    //     onTap: onTap,
                    //     selectItemsCubitTemp: selectItemsCubitTemp),
                    // SizedBox(height: 12.h),
                    // SelectItemList(
                    //       name: AppNames.subCategoryName,
                    //       onTap: onTap,
                    //       selectItemsCubitTemp: selectItemsCubitTemp),
                    // SizedBox(height: 12.h),
                    // SelectItemList(
                    //       name: AppNames.productName, onTap: onTap, selectItemsCubitTemp: selectItemsCubitTemp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          textFieldValidatorType: null,
                          hint: AppNames.amount,
                          width: 165.w,
                        ),
                        CustomTextField(
                          textFieldValidatorType: null,
                          hint: AppNames.amount,
                          width: 165.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
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
              ]),
            ))
      ],
    );
  }
}
