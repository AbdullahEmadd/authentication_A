import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_button/custom_button.dart';
import 'package:manager/src/components/custom_text/custom_text.dart';
import 'package:manager/src/components/custom_text_field/custom_text_field.dart';
import 'package:manager/src/components/loader_custom/loader_custom.dart';
import 'package:manager/src/helpers/validation.dart';
import 'package:manager/src/screens/managers_screens/add_sub_unit_screen/add_sub_unit_view_model.dart';
import 'package:manager/src/utility/app_colors.dart';
import 'package:manager/src/utility/app_names.dart';

class AddSubUnitScreen extends StatefulWidget {
  const AddSubUnitScreen({super.key});

  @override
  State<AddSubUnitScreen> createState() => _AddSubUnitScreenState();
}

class _AddSubUnitScreenState extends State<AddSubUnitScreen> {
  AddSubUnitViewModel addSubUnitViewModel = AddSubUnitViewModel();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
                text: AppNames.addSubUnit,
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
                      key: addSubUnitViewModel.addSubUnitKey,
                      child: CustomTextField(
                          controller: addSubUnitViewModel.subUnitName,
                          hint: AppNames.addSubUnitName,
                          textFieldValidatorType: TextFieldValidatorType.displayText),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      text: AppNames.addSubUnit,
                      function: (){
                        if(addSubUnitViewModel.addSubUnitKey.currentState!.validate()) {
                          addSubUnitViewModel.addSubUnit();
                        }
                      },
                    ),
                  ],
                ),
              )
          ),
        ),
        Loader(loading: addSubUnitViewModel.loading)
      ],
    );
  }
}
