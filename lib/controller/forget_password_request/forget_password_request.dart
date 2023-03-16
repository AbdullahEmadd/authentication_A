import 'dart:convert';
import 'package:first_task/models/authentication/enter_new_password_model.dart';
import 'package:first_task/models/authentication/regenerate_code_model.dart';
import 'package:first_task/services/app_services.dart';
import '../../models/authentication/enter_code_model.dart';
import '../../models/authentication/forget_password_return_model.dart';

class ForgetPasswordController {
  static Future<ForgetPasswordReturnModel?> forgetPassword(
      {required String userName,}) async {
    var result = await AppService.callService(
      actionType: ActionType.post,
      apiName: "Account/ForgotPassword",
      body: {
        "Username": userName,
      });
    return result != null? ForgetPasswordReturnModel.fromJson(json.decode(result))
        : null;
  }

  static Future<EnterCodeModel?> codeConfirmation(
      {required String userName,
        required String code}) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Account/ForgotPasswordConfirmation",
        body: {
          "Code": code,
          "Username": userName
        });
    return result != null? EnterCodeModel.fromJson(json.decode(result))
        : null;
  }

  static Future<EnterNewPasswordModel?> resetPasswordRequest(
      {required String userName,
        required String password,
        required String passwordConfirmation,}) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Account/ResetPassword",
        body: {
          "Username": userName,
          "Password": password,
          "ConfirmPassword": passwordConfirmation,
        });
    return result != null? EnterNewPasswordModel.fromJson(json.decode(result))
        : null;

  }
  static Future<RegenerateCodeModel?> regenerateCodeRequest({
    required String userName,}) async{
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Account/ReGenrateCode",
        body: {
          "Username": userName
        });
    return result!= null? RegenerateCodeModel.fromJson(json.decode(result))
        : null;
}
}
