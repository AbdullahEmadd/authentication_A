import 'dart:convert';
import 'package:first_task/services/app_services.dart';
import '../../models/authentication/login_model.dart';

class LoginController {
  static Future<LoginModel?> login({
    required String userName,
    required String password,
  }) async {
    var result = await AppService.callService(
        actionType: ActionType.post,
        apiName: "Account/Login",
        body: {
          "username": userName,
          "password": password,
        });
    return result != null ? LoginModel.fromJson(json.decode(result)) : null;
  }
}
