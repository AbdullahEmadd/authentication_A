import 'package:first_task/controller/forget_password_request/forget_password_request.dart';
import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';
import 'package:first_task/models/authentication/regenerate_code_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordViewModel {
  final forgetKey = GlobalKey<FormState>();
  final enterCodeKey = GlobalKey<FormState>();
  Loading loading = Loading();
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

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
  }
}