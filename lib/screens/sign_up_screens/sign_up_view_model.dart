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
  Loading loading = Loading();


  managerSignUp() async {
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
