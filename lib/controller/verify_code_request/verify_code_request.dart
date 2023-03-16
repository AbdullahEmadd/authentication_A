import 'dart:convert';
import 'package:first_task/services/app_services.dart';
import '../../models/authentication/verify_code_model.dart';

class VerifyCodeController{
  static Future<VerifyCodeModel?>verify({required String userName ,
    required String password ,
    required String code,})async{
        var result = await AppService.callService(
          actionType: ActionType.post,
          apiName: "Account/VerifyCode",
          body: {
            "Username": userName,
            "Password": password,
            "Code": code,
          });
    return result !=null? VerifyCodeModel.fromJson(json.decode(result)): null;
  }
}