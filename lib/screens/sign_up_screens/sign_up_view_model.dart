import 'package:first_task/controller/verify_code_request/verify_code_request.dart';
import 'package:first_task/models/authentication/verify_code_model.dart';
import 'package:first_task/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../models/authentication/sign_up_model.dart';
import '../../controller/sign_up_request/sign_up_request.dart';
import 'package:get/get.dart';
import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';



class SignUpViewModel {
  GlobalKey<FormState> verifyCodeKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Loading loading = Loading();

  adminSignUp() async {
    loading.show;
    SignUpModel? signUpModel = await SignUpController.signUp(
      userName: userNameController.text,
      password: passwordController.text,
      name: nameController.text,
      email: emailController.text,
      passwordConfirmation: passwordConfirmationController.text,
      phone: phoneController.text,
      role: 'Manager',
    );

    if (signUpModel != null) {
      Get.snackbar('Success', signUpModel.message![0].value.toString());
      goToScreen(screenNames: ScreenNames.verifyCodeScreen);
    }
    loading.hide;
  }

  verifyCode() async{
      loading.show;
      VerifyCodeModel? verifyCodeModel = await VerifyCodeController.verify(
      userName: userNameController.text,
      password: passwordController.text,
      code: codeController.text,
    );
    if (verifyCodeModel != null) {
      if (verifyCodeModel.state == true) {
        Get.snackbar('Success', verifyCodeModel.message![0].value.toString());
        goToScreen(screenNames: ScreenNames.managerHomeScreen);
      }
      else {
        Get.snackbar('Error', verifyCodeModel.message![0].value.toString());
      }
    }
    loading.hide;
    }
  }
