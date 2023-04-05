import 'dart:convert';
import 'package:first_task/controller/login_request/login_request.dart';
import 'package:first_task/cubits/generic_cubit/generic_cubit.dart';
import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/models/authentication/login_model.dart';
import 'package:first_task/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:manager/manager.dart';

class LoginViewModel{
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  Loading loading = Loading();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GenericCubit<bool> obscure = GenericCubit(data: true);
  void toggle(){
    obscure.update(data: !obscure.state.data!);
  }
  userLogin({required String userName, required String password}) async {
    loading.show;
    LoginModel? loginModel = await LoginController.login(
      userName: userName,
      password: password,
    );
    if (loginModel != null) {
      if (loginModel.data!.user!.emailConfirmed == true) {
        // Get.snackbar('Success', loginModel.message![0].value.toString());
        print('Company Id is: ${loginModel.data!.user!.companyId}');
        CacheHelper.saveData(key: 'UserData', value: jsonEncode((loginModel)));
        CacheHelper.saveData(key: 'companyId', value: loginModel.data!.user!.companyId);
        runApp(StartManagerCycle(
          companyId: loginModel.data!.user!.companyId,
          name: loginModel.data!.user!.name,
        ));
      } else {
        goToScreen(screenNames: ScreenNames.verifyCodeScreen, arguments: [userName,password]);
      }
    }
    loading.hide;
  }
}