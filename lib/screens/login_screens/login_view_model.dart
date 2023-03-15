import 'dart:convert';
import 'package:first_task/controller/login_request/login_request.dart';
import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/models/authentication/login_model.dart';
import 'package:first_task/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel{

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  Loading loading = Loading();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  userLogin({required String userName, required String password}) async {

    loading.show;
    LoginModel? loginModel = await LoginController.login(
      userName: userName,
      password: password,
    );

    if (loginModel != null) {
      if (loginModel.data!.user!.emailConfirmed == true) {
        goToScreen(screenNames: ScreenNames.managerHomeScreen);
        Get.snackbar('Success', loginModel.message![0].value.toString());
        CacheHelper.saveData(key: 'UserData', value: jsonEncode((loginModel)));
      } else {
        goToScreen(screenNames: ScreenNames.verifyCodeScreen);
      }
    }
    loading.hide;
  }
}