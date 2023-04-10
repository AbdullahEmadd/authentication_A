import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_select_item/custom_select_item_list.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/screens/manager_screens/unit_screens/add_sub_unit_screen/add_sub_unit_view_model.dart';
import 'package:manager/src/screens/manager_screens/unit_screens/get_sub_units_screen/get_sub_units_view_model.dart';
import 'package:manager/src/utility/app_names.dart';

class AddSubUnitScreen extends StatefulWidget {
  final GetSubUnitsViewModel? getSubUnitsViewModel;

  const AddSubUnitScreen({super.key, this.getSubUnitsViewModel});

  @override
  State<AddSubUnitScreen> createState() => _AddSubUnitScreenState();
}

class _AddSubUnitScreenState extends State<AddSubUnitScreen> {
  AddSubUnitViewModel addSubUnitViewModel = AddSubUnitViewModel();

  @override
  void initState() {
    addSubUnitViewModel.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            textAppBar: AppNames.addSubUnit,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                SelectItemList(
                    name: AppNames.chooseUnitName,
                    onTap: addSubUnitViewModel.getMainUnitDialog,
                    selectItemsCubitTemp: addSubUnitViewModel.getMainUnitCubit),
                SizedBox(height: 10.h),
                Form(
                    key: addSubUnitViewModel.addSubUnitKey,
                    child: Column(children: [
                      CustomTextField(
                          controller: addSubUnitViewModel.subUnitName,
                          hint: AppNames.addSubUnitName,
                          textFieldValidatorType:
                              TextFieldValidatorType.displayText),
                      CustomTextField(
                          controller: addSubUnitViewModel.symbol,
                          hint: 'الرمز',
                          textFieldValidatorType:
                              TextFieldValidatorType.displayText),
                      CustomTextField(
                          controller: addSubUnitViewModel.quantityPerUnit,
                          textType: TextInputType.number,
                          hint: 'الكمية لكل وحدة',
                          textFieldValidatorType:
                              TextFieldValidatorType.number),
                      CustomTextField(
                          controller: addSubUnitViewModel.quantityPerUnitGroup,
                          hint: 'الكمية لكل مجموعة وحدة',
                          textType: TextInputType.number,
                          textFieldValidatorType:
                              TextFieldValidatorType.number),
                    ])),
                SizedBox(height: 10.h),
                CustomButton(
                  text: AppNames.addSubUnit,
                  function: () {
                    addSubUnitViewModel.addSubUnit();
                  },
                ),
              ],
            ),
          )),
        ),
        Loader(loading: addSubUnitViewModel.loading)
      ],
    );
  }
}
