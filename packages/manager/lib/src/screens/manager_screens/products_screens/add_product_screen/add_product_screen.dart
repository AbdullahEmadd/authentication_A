import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_checkbox/custom_checkbox.dart';
import 'package:manager/src/components/custom_select_item/custom_select_item_list.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/cubits/generic_cubit/generic_cubit.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/screens/manager_screens/products_screens/add_product_screen/add_product_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_fonts.dart';
import 'package:manager/src/utility/app_names.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  AddProductViewModel addProductViewModel = AddProductViewModel();
  @override
  void initState() {
    addProductViewModel.initialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(textAppBar: AppNames.addProduct,),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                children: [
                  BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                      bloc: addProductViewModel.selectedImagePath,
                      builder: (context, state) {
                        return Column(children: [
                          state.data == null
                              ? InkWell(
                            onTap: () async {
                              addProductViewModel.selectImage();
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
                              addProductViewModel.selectImage();
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
                    bloc: addProductViewModel.isImage,
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
                    key: addProductViewModel.addProductKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: AppNames.productName,
                          textFieldValidatorType: TextFieldValidatorType.displayText,
                          controller: addProductViewModel.productName,
                        ),
                        CustomTextField(
                          hint: AppNames.productDescription,
                          textFieldValidatorType: TextFieldValidatorType.displayText,
                          controller: addProductViewModel.productDescription,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SelectItemList(
                    name: AppNames.chooseCategoryName,
                    selectItemsCubitTemp: addProductViewModel.getMainCategoryCubit,
                    onTap: addProductViewModel.getMainCategoryDialog,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SelectItemList(
                    name: AppNames.chooseSubCategoryName,
                    selectItemsCubitTemp: addProductViewModel.getSubCategoryCubit,
                    onTap: addProductViewModel.getSubCategoryDialog,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SelectItemList(
                    name: AppNames.chooseMainUnitName,
                    selectItemsCubitTemp: addProductViewModel.getMainUnitsCubit,
                    onTap: addProductViewModel.getMainUnitsDialog,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SelectItemList(
                    name: AppNames.chooseSubUnitName,
                    selectItemsCubitTemp: addProductViewModel.getSubUnitsCubit,
                    onTap: addProductViewModel.getSubUnitsDialog,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
                    bloc: addProductViewModel.isOptional,
                    builder: (context, state) {
                      return CustomCheckbox(
                          value: state.data,
                          onChanged: (val) => addProductViewModel.isOptional.update(
                              data: !state.data!),
                          text: AppNames.isProductOptional);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    width: 216.w,
                    text: AppNames.addProduct,
                    function: () {
                      if (addProductViewModel.addProductKey.currentState!
                          .validate() &&
                          addProductViewModel.selectedImagePath.state.data !=
                              null) {
                        addProductViewModel.addProduct();
                      } else {
                        if (addProductViewModel.selectedImagePath.state.data ==
                            null) {
                          addProductViewModel.isImage.update(data: true);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Loader(loading: addProductViewModel.loading),
      ],
    );
  }
}
