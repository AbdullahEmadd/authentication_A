import 'dart:convert';
import 'package:first_task/services/app_services.dart';

import '../../models/authentication/sign_up_model.dart';
class SignUpController {
  static Future<SignUpModel?> signUp(
      {required String userName,
        required String name,
        required String phone,
        required String role,
        required String email,
        required String password,
        required String passwordConfirmation,
        }) async {
    var result = await AppService.callService(
      actionType: ActionType.post
    , apiName: "Account/Register", 
    body: {
      "Username" : userName,
      "PhoneNumber": phone,
      "Name": name,
      "Email": email,
      "Role": role,
      "Password": password,
      "ConfirmPassword": passwordConfirmation,
    });
    return result != null ? SignUpModel.fromJson(json.decode(result)) : null;
  }}
