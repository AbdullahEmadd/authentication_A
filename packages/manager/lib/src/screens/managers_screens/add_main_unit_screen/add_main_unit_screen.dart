import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/add_main_unit_screen/add_main_unit_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class AddMainUnitScreen extends StatefulWidget {
  const AddMainUnitScreen({super.key});


  @override
  State<AddMainUnitScreen> createState() => _AddMainUnitScreenState();
}

class _AddMainUnitScreenState extends State<AddMainUnitScreen> {
  AddMainUnitViewModel addMainUnitViewModel = AddMainUnitViewModel();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
                text: AppNames.addMainUnit,
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
                  SizedBox(height: 130.h),
                  Form(
                    key: addMainUnitViewModel.addMainUnitKey,
                    child: CustomTextField(
                      controller: addMainUnitViewModel.mainUnitName,
                      hint: AppNames.addMainUnit,
                      textFieldValidatorType: TextFieldValidatorType.displayText),
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    text: AppNames.addMainUnit,
                    function: (){
                      if(addMainUnitViewModel.addMainUnitKey.currentState!.validate()) {
                        addMainUnitViewModel.addMainUnit();
                      }
                      },
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                      text: AppNames.subUnits,
                      function: (){goToScreen(screenNames: ScreenNames.getSubUnitsScreen);})
                ],
              ),
            )
          ),
        ),
        Loader(loading: addMainUnitViewModel.loading)
      ],
    );
  }
}
