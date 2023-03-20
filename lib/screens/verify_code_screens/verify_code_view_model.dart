import 'package:first_task/controller/forget_password_request/forget_password_request.dart';
import 'package:first_task/controller/sign_up_request/sign_up_request.dart';
import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';
import 'package:first_task/models/authentication/regenerate_code_model.dart';
import 'package:first_task/models/authentication/verify_code_model.dart';
import 'package:first_task/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager/manager.dart';

class VerifyCodeViewModel{

TextEditingController codeController = TextEditingController();
Loading loading = Loading();
GlobalKey<FormState> verifyKey = GlobalKey<FormState>();

verifyCode({required String userName, required String password, required String code }) async {
    loading.show;
    VerifyCodeModel? verifyCodeModel = await SignUpController.verify(
    userName: userName,
    password: password,
    code: code,
  );
  if (verifyCodeModel != null) {
    if (verifyCodeModel.state == true) {
      Get.snackbar('Success', verifyCodeModel.message![0].value.toString());
      runApp(StartManagerCycle());
    }
    else {
      Get.snackbar('Error', verifyCodeModel.message![0].value.toString());
    }
  }
  loading.hide;
}
regenerateCode({required String userName}) async{
  loading.show;
  RegenerateCodeModel? regenerateCodeModel = await ForgetPasswordController.regenerateCodeRequest(
    userName: userName,
  );
  if (regenerateCodeModel != null ) {
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

}