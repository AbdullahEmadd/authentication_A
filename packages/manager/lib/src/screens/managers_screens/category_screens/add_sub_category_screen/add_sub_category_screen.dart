import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/screens/managers_screens/category_screens/get_sub_categories_screen/get_sub_categories_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

import '../../../../components/custom_select_item/custom_select_item_list.dart';
import '../../../../utility/app_fonts.dart';
import 'add_sub_category_view_model.dart';

class AddSubCategoryScreen extends StatefulWidget {
  final bool? isOptional ;
  final String? subCategoryId ;
  final GetSubCategoriesForMainCategoryViewModel? getSubCategoriesForMainCategoryViewModel ;

  const AddSubCategoryScreen(
      {super.key,
      this.isOptional,
      this.subCategoryId,
      this.getSubCategoriesForMainCategoryViewModel});

  @override
  State<AddSubCategoryScreen> createState() => _AddSubCategoryScreenState();
}

class _AddSubCategoryScreenState extends State<AddSubCategoryScreen> {
  AddSubCategoryViewModel addSubCategoryViewModel = AddSubCategoryViewModel();

  @override
  void initState() {
    addSubCategoryViewModel.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(textAppBar: AppNames.addSubCategory,),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h,),
                  BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                      bloc: addSubCategoryViewModel.selectedImagePath,
                      builder: (context, state) {
                        return Column(children: [
                          state.data == null
                              ? InkWell(
                                  onTap: () async {
                                    addSubCategoryViewModel.selectImage();
                                  },
                                  child: Container(
                                    height: 180.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.gray2),
                                    child: const Icon(Icons.add_a_photo),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    addSubCategoryViewModel.selectImage();
                                  },
                                  child: Image.file(
                                    state.data!,
                                    height: 180.h,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ]);
                      }),
                  BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
                    bloc: addSubCategoryViewModel.isImage,
                    builder: (context, state) {
                      return !state.data!
                          ? Container()
                          : Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomText(
                                  text: 'برجاء اضافه الصورة',
                                  fontSize: 14.sp ,
                                  fontFamily: AppFonts.fontMedium,
                                  color: Colors.red,
                                ),
                              ],
                            );
                    },
                  ),
                  SizedBox(height: 10.h,),
                  SelectItemList(
                    name: AppNames.chooseCategoryName,
                    selectItemsCubitTemp: addSubCategoryViewModel.getMainCategoryCubit,
                    onTap: addSubCategoryViewModel.getMainCategoryDialog,
                  ),

                  !addSubCategoryViewModel.addSubCategoryScreen.isOptional!?
                  Column(
                    children: [
                      SizedBox(height: 10.h,),
                      SelectItemList(
                        name:  AppNames.chooseAdditions,
                        selectItemsCubitTemp: addSubCategoryViewModel.getAdditionsCategoryCubit,
                        onTap: addSubCategoryViewModel.getAdditionsCategoryDialog,
                        enable: !addSubCategoryViewModel.addSubCategoryScreen.isOptional!,
                      ),
                    ],
                  ):Container(),

                  Form(
                    key: addSubCategoryViewModel.addSubCategoryKey,
                    child: CustomTextField(
                      hint: AppNames.subCategoryName,
                      textFieldValidatorType: TextFieldValidatorType.displayText,
                      controller: addSubCategoryViewModel.subCategoryName,
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  CustomButton(
                    width: 216.w,
                    text: AppNames.addSubCategory,
                    function: () {
                      addSubCategoryViewModel.addSubCategory();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Loader(loading: addSubCategoryViewModel.loading),
      ],
    );
  }
}
