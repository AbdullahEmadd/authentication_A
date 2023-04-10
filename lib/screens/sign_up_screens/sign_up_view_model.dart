import 'dart:convert';

import 'package:first_task/cubits/generic_cubit/generic_cubit.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../models/authentication/sign_up_model.dart';
import '../../controller/sign_up_request/sign_up_request.dart';
import 'package:get/get.dart';
import 'package:first_task/cubits/loading_cubit/loading_cubit.dart';


class SignUpViewModel {
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> verifyKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GenericCubit<bool> obscure1 = GenericCubit(data: true);
  Loading loading = Loading();

  void password (){
    obscure1.update(data: !obscure1.state.data!);
  }



  managerSignUp({required String userName, required String password}) async {
    loading.show;
    SignUpModel? signUpModel = await SignUpController.signUp(
      userName: userName,
      password: password,
      name: nameController.text,
      email: emailController.text,
      passwordConfirmation: passwordConfirmationController.text,
      phone: phoneController.text,
      role: 'Manager',
    );
    if (signUpModel != null) {
      CacheHelper.saveData(key: 'UserData', value: jsonEncode((signUpModel)));
      CacheHelper.saveData(key: 'companyId', value: signUpModel.data!.user!.companyId);
      Get.snackbar('Success', signUpModel.message![0].value.toString());
      goToScreen(screenNames: ScreenNames.verifyCodeScreen, arguments: [userName, password]);
    }
    loading.hide;
  }

  // verifyCode({required String userName, required String password, required String code }) async{
  //     loading.show;
  //     VerifyCodeModel? verifyCodeModel = await SignUpController.verify(
  //     userName:  userName,
  //     password: password,
  //     code: code,
  //   );
  //   if (verifyCodeModel != null) {
  //     if (verifyCodeModel.state == true) {
  //       Get.snackbar('Success', verifyCodeModel.message![0].value.toString());
  //       goToScreen(screenNames: ScreenNames.managerHomeScreen);
  //     }
  //     else {
  //       Get.snackbar('Error', verifyCodeModel.message![0].value.toString());
  //     }
  //   }
  //   loading.hide;
  //   }
  }
