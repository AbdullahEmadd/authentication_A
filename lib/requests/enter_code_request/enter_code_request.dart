import 'dart:convert';
import 'dart:developer';
import 'package:first_task/models/authentication/enter_code_model.dart';
import '../../models/authentication/login_model.dart';
import '../../services/global_helper_method.dart';
import '../../utility/app_consts.dart';
import 'package:http/http.dart' as http;

class EnterCodeRequest{
  static enterCode({required String code ,
    required String userName ,
    required Function(EnterCodeModel enterCodeModel) onSuccess,
    required Function(String error) onError})async{
    try {
      //API Calling
      // String token = await getToken();
      var headers = {...apiHeaders};
      // "Authorization" : token,
      await http.post(
          getUri('${AppConsts.baseUrl}Account/ForgotPasswordConfirmation'),
          headers: headers,
          body: json.encode({
            "Username": userName,
            "Code": code,
          })
      ).then((response) async{
        log(response.body + "\n" + response.statusCode.toString());
        // modiling
        if (response.statusCode==200) {
          EnterCodeModel enterCodeModel= EnterCodeModel.fromJson(json.decode(response.body));
          onSuccess(enterCodeModel);
        }
        else {
          log(response.body);
        }
        // Debugging API response
        debugApi(
            methodName: "Enter Code",
            statusCode: response.statusCode,
            response: response.body,
            data: {
              "Username": userName,
              "Code": code,
            },
            endPoint: response.request!.url.toString(),
            headers: headers);
      }, onError: (error) {
        log("error happened from enter code ${error.toString()}");
        onError(error.toString());
      });
    }catch(e){
      log("error happened from enter code ${e.toString()}");
      onError(e.toString());
    }
  }
  static void resetPasswordRequest(
      {required String userName,
        required String password,
        required String passwordConfirmation,
        required Function() onSuccess,
        required Function(String error) onError}) async {
    try {
      //API Calling

      // String token = await getToken();
      var headers = {...apiHeaders};
      // "Authorization" : token,
      await http
          .post(
          getUri(
              '${AppConsts.baseUrl}Account/ResetPassword'),
          headers: headers,
          body: json.encode({
            "Username": userName,
            "Password": password,
            "ConfirmPassword": passwordConfirmation,
          }))
          .then((response) async {
        log(response.body + "\n" + response.statusCode.toString());
        // modiling
        if (response.statusCode == 200) {
          onSuccess();
        } else {
          log(response.body);
        }
        // Debugging API response
        debugApi(
            methodName: "code Confirmation ",
            statusCode: response.statusCode,
            response: response.body,
            data: {
              "Username": userName,
              "Password": password,
              "PasswordConfirmation": passwordConfirmation,
            },
            endPoint: response.request!.url.toString(),
            headers: headers);
      }, onError: (error) {
        log("error happened from reset password  ${error.toString()}");
        onError(error.toString());
      });
    } catch (e) {
      log("error happened from reset password Request ${e.toString()}");
      onError(e.toString());
    }
  }
}