import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_button.dart';
import 'package:manager/src/components/custom_text.dart';
import 'package:manager/src/components/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/helpers/Validation.dart';
import 'package:manager/src/models/categories_model/drop_down_model.dart';
import 'package:manager/src/screens/managers_screens/add_category_screens/add_category_view_model.dart';
import 'package:manager/src/screens/managers_screens/get_categories_screens/get_main_categories_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class AddSubCategoryScreen extends StatefulWidget {
  @override
  State<AddSubCategoryScreen> createState() => _AddSubCategoryScreenState();
}

class _AddSubCategoryScreenState extends State<AddSubCategoryScreen> {
  AddCategoryViewModel addCategoryViewModel = AddCategoryViewModel();
  GetMainCategoriesViewModel getMainCategoriesViewModel =
      GetMainCategoriesViewModel();
  var value;
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
                text: AppNames.addSubCategory,
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                      bloc: addCategoryViewModel.selectedImagePath,
                      builder: (context, state) {
                        return Column(children: [
                          state.data == null
                              ? InkWell(
                                  onTap: () async {
                                    addCategoryViewModel.selectImage();
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
                                    addCategoryViewModel.selectImage();
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
                    bloc: addCategoryViewModel.isImage,
                    builder: (context, state) {
                      return !state.data!
                          ? Container()
                          : Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomText(
                                    text: 'Please insert image',
                                    fontSize: 16.sp),
                              ],
                            );
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: BorderRadius.circular(10)),
                    child: BlocBuilder<GenericCubit<List<DropDownModel>>, GenericState<List<DropDownModel>>>(
                      bloc: getMainCategoriesViewModel.mainCategoriesNames,
                      builder: (context, state) {
                        return state is GenericUpdate? Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: getMainCategoriesViewModel.dropDownKey,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              validator: (value) => value == null ? 'field required' : null,
                              items: state.data!
                                  .map((item) => DropdownMenuItem<DropDownModel>(
                                        value: item,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.name!,
                                            ),
                                            Text(item.id!,
                                            style: TextStyle(
                                              fontSize: 10.sp
                                            ),)
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) => setState(() => this.value = (value as DropDownModel)),
                              value: value,
                              isExpanded: true,
                              hint: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: CustomText(
                                  text: AppNames.mainCategoryName,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ): Container();
                      },
                    ),
                  ),
                  Form(
                    key: addCategoryViewModel.addSubCategoryKey,
                    child: CustomTextField(
                      hint: AppNames.subCategoryName,
                      textFieldVaidType: TextFieldvalidatorType.RegisterText,
                      controller: addCategoryViewModel.subCategoryName,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    width: 216.w,
                    text: AppNames.addSubCategory,
                    function: () {
                      if (addCategoryViewModel.addSubCategoryKey.currentState!
                              .validate() &&
                          addCategoryViewModel.selectedImagePath.state.data !=
                              null && getMainCategoriesViewModel.dropDownKey.currentState!.validate()) {
                        addCategoryViewModel.addSubCategory(
                          parentCategoryId: '1905b126-224c-48f4-9e95-5712d2067cd1'
                        );
                      } else {
                        if (addCategoryViewModel.selectedImagePath.state.data ==
                            null) {
                          addCategoryViewModel.isImage.update(data: true);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Loader(loading: addCategoryViewModel.loading),
      ],
    );
  }
}
