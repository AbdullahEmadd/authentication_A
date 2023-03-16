import 'dart:io';

import 'package:first_task/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/custom_button.dart';
import '../../helpers/Validation.dart';
import '../../utility/app_colors.dart';
import '../../utility/app_names.dart';

class AddCategoryScreen extends StatefulWidget {
  static String routeName = "AddCategoryScreen";


  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  // File? _image;
  // ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppNames.addCategory,
          style: TextStyle(
              fontFamily: 'Almarai',
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),),
        actions: [Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(onPressed: (){},
            icon: Icon(Icons.notifications_outlined),
            iconSize: 35,
          ),
        ),],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: AppColors.gray2
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.add_a_photo
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                hint: AppNames.categoryName,
                textFieldVaidType:  TextFieldvalidatorType.RegisterText,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                text: AppNames.addCategory,
                function: (){},
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
