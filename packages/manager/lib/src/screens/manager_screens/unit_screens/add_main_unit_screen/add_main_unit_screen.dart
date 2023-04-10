import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_app_bar/custom_app_bar.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/screens/manager_screens/unit_screens/add_main_unit_screen/add_main_unit_view_model.dart';
import 'package:manager/src/utility/app_names.dart';

class AddMainUnitScreen extends StatefulWidget {
  const AddMainUnitScreen({super.key});

  @override
  State<AddMainUnitScreen> createState() => _AddMainUnitScreenState();
}

class _AddMainUnitScreenState extends State<AddMainUnitScreen> {
  AddMainUnitViewModel addMainUnitViewModel = AddMainUnitViewModel();

  @override
  void initState() {
    addMainUnitViewModel.initData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            textAppBar: AppNames.addMainUnit,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Form(
                    key: addMainUnitViewModel.addMainUnitKey,
                    child: CustomTextField(
                      controller: addMainUnitViewModel.mainUnitName,
                      hint: AppNames.addMainUnit,
                      textFieldValidatorType: TextFieldValidatorType.displayText),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: AppNames.addMainUnit,
                    function: (){
                      if(addMainUnitViewModel.addMainUnitKey.currentState!.validate()) {
                        addMainUnitViewModel.addMainUnit();
                      }
                      },
                  ),
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
