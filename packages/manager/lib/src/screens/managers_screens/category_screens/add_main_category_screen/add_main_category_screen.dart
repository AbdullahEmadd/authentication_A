import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_checkbox/custom_checkbox.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/helpers/Validation.dart';
import 'package:manager/src/screens/managers_screens/category_screens/add_main_category_screen/add_category_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_fonts.dart';
import 'package:manager/src/utility/app_names.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  AddCategoryViewModel addCategoryViewModel = AddCategoryViewModel();

  @override
  void initState() {
    addCategoryViewModel.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(textAppBar: AppNames.addMainCategory,),
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
                  Form(
                    key: addCategoryViewModel.addMainCategoryKey,
                    child: CustomTextField(
                      hint: AppNames.mainCategoryName,
                      textFieldVaidType: TextFieldvalidatorType.RegisterText,
                      controller: addCategoryViewModel.mainCategoryName,
                    ),
                  ),
                  BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
                    bloc: addCategoryViewModel.isOptional,
                    builder: (context, state) {
                      return CustomCheckbox(
                          value: state.data,
                          onChanged: (val) => addCategoryViewModel.isOptional.update(
                                      data: !state.data!),
                          text: AppNames.isOptional);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    width: 216.w,
                    text: AppNames.addMainCategory,
                    function: () {
                      if (addCategoryViewModel.addMainCategoryKey.currentState!
                              .validate() &&
                          addCategoryViewModel.selectedImagePath.state.data !=
                              null) {
                        addCategoryViewModel.addMainCategory(
                            isOptional:
                                addCategoryViewModel.isOptional.state.data!);
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
