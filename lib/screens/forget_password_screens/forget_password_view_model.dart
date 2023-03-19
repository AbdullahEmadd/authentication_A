import 'package:first_task/controller/forget_password_request/forget_password_request.dart';
import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';
import 'package:first_task/models/authentication/enter_code_model.dart';
import 'package:first_task/models/authentication/enter_new_password_model.dart';
import 'package:first_task/models/authentication/forget_password_return_model.dart';
import 'package:first_task/models/authentication/regenerate_code_model.dart';
import 'package:first_task/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordViewModel {
  final forgetKey = GlobalKey<FormState>();
  final enterCodeKey = GlobalKey<FormState>();
  final newPasswordKey = GlobalKey<FormState>();
  Loading loading = Loading();
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();



  forgetPassword({required String userName}) async{
    loading.show;
    ForgetPasswordReturnModel? forgetPasswordReturnModel = await ForgetPasswordController.forgetPassword(
      userName: userName,
    );
    if (forgetPasswordReturnModel != null) {
      if (forgetPasswordReturnModel.state == true) {
        goToScreen(screenNames: ScreenNames.enterCodeScreen, arguments: userName);
      }
      else {
        Get.snackbar('خطأ', forgetPasswordReturnModel.message![0]
            .value.toString());
      }
    }
    loading.hide;
  }

  codeConfirmation({required String userName, required String code}) async{
    loading.show;
    EnterCodeModel? enterCodeModel = await ForgetPasswordController.codeConfirmation(
      code: code,
      userName: userName);
    if (enterCodeModel != null) {
      if (enterCodeModel.state == true) {
        Get.snackbar('Success', enterCodeModel.message![0].value.toString());
        goToScreen(screenNames: ScreenNames.enterNewPasswordScreen, arguments: userName);
      }
      else {
        Get.snackbar('Error', enterCodeModel.message![0]
            .value.toString());
      }
    }
    loading.hide;
  }

  regenerateCode() async{
    loading.show;
    RegenerateCodeModel? regenerateCodeModel = await ForgetPasswordController.regenerateCodeRequest(
      userName: userNameController.text,
    );
    if (regenerateCodeModel !=null ) {
      if (regenerateCodeModel.state == true) {
        Get.snackbar(
            'Success',
            regenerateCodeModel.message![0].value
                .toString());
      } else {
        Get.snackbar(
            'Error',
            regenerateCodeModel.message![0].value
                .toString());
      }
    }
    loading.hide;
  }

  resetPassword({required String userName}) async{
    loading.show;
    EnterNewPasswordModel? enterNewPasswordModel = await ForgetPasswordController.resetPasswordRequest(
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      userName: userName,);
    if (enterNewPasswordModel != null) {
      if(enterNewPasswordModel.state ==true) {
        Get.snackbar('Success',
            enterNewPasswordModel.message![0].value
                .toString());
        goToScreen(screenNames: ScreenNames.loginScreen);
      }
      else {
        Get.snackbar('Error', enterNewPasswordModel.message![0].value.toString());
      }
    }
    loading.hide;
  }
}