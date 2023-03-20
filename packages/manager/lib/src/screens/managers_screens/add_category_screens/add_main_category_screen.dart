// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manager/src/components/custom_text.dart';
import 'package:manager/src/components/custom_text_field.dart';
import 'package:manager/src/routes/routes.dart';
import 'package:manager/src/screens/managers_screens/add_category_screens/add_category_view_model.dart';
import '../../../components/custom_button.dart';
import '../../../helpers/Validation.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_names.dart';

class AddCategoryScreen extends StatefulWidget {

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  // File? _image;
  // ImagePicker imagePicker = ImagePicker();
  AddCategoryViewModel addCategoryViewModel = AddCategoryViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            text: AppNames.addCategory,
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.gray2),
                  child: Icon(Icons.add_a_photo),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                hint: AppNames.categoryName,
                textFieldVaidType: TextFieldvalidatorType.RegisterText,
                controller: addCategoryViewModel.mainCategoryName,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                width: 216.w,
                text: AppNames.addCategory,
                function: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

// void pickImage() async{
//   var image = await imagePicker.pickImage(source: ImageSource.gallery);
//   setState(() {
//     _image = image as File?;
//   });
// }
}
