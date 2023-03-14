import 'dart:convert';
import 'dart:developer';
import 'package:first_task/services/app_services.dart';

import '../../models/authentication/login_model.dart';
import '../../models/authentication/verify_code_model.dart';
import '../../services/global_helper_method.dart';
import '../../utility/app_consts.dart';
import 'package:http/http.dart' as http;

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
  }}