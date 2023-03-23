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
import 'package:manager/src/screens/managers_screens/add_category_screens/add_category_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class AddSubCategoryScreen extends StatefulWidget {

  @override
  State<AddSubCategoryScreen> createState() => _AddSubCategoryScreenState();
}

class _AddSubCategoryScreenState extends State<AddSubCategoryScreen> {
  AddCategoryViewModel addCategoryViewModel = AddCategoryViewModel();
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
                  icon: Icon(Icons.notifications_outlined),
                  iconSize: 35,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  BlocBuilder<GenericCubit<String>, GenericState<String>>(
                      bloc: addCategoryViewModel.selectedImagePath,
                      builder: (context, state) {
                        return Column(children: [
                          state.data == ''
                              ? InkWell(
                            onTap: () async {
                              addCategoryViewModel.selectImageFromGallery();
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
                              : Image.file(
                            File(state.data!),
                            height: 180.h,
                            width: double.infinity,
                          ),
                        ]);
                      }),
                  // BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
                  //   bloc: addCategoryViewModel.isImage,
                  //   builder: (context, state) {
                  //     return !state.data!
                  //         ? Container()
                  //         : Column(
                  //       children: [
                  //         SizedBox(
                  //           height: 15.h,
                  //         ),
                  //         CustomText(
                  //             text: 'Please insert image',
                  //             fontSize: 16.sp),
                  //       ],
                  //     );
                  //   },
                  // ),
                  SizedBox(
                    height: 30.h,
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
                          .validate() ==
                          true) {
                        addCategoryViewModel.addSubCategory();
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
