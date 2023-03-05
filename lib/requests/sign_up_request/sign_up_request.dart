import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/authentication/sign_up_model.dart';
import '../../services/global_helper_method.dart';
import '../../utility/app_consts.dart';
class SignUpRequest {
  static void signUp(
      {required String userName,
        required String name,
        required String phone,
        required String role,
        required String email,
        required String password,
        required String passwordConfirmation,
        required Function(SignUpModel signUpModel) onSuccess,
        required Function(String error) onError}) async {
    try {
      //API Calling
      // String token = await getToken();
      var headers = {...apiHeaders};
      // "Authorization" : token,
      await http
          .post(
          getUri(
              '${AppConsts.baseUrl}Account/Register'),
          headers: headers,
          body: json.encode({
            "Username": userName,
            "PhoneNumber": phone,
            "Name": name,
            "Role": role,
            "Email": email,
            "ConfirmPassword": passwordConfirmation,
            "Password": password,
          }))
          .then((response) async {
        log(response.body + "\n" + response.statusCode.toString());
        // modiling
        if (response.statusCode == 200) {
          SignUpModel signUpModel =
          SignUpModel.fromJson(json.decode(response.body));
          onSuccess(signUpModel);
        } else {}
        // Debugging API response
        debugApi(
            methodName: "Sign Up",
            statusCode: response.statusCode,
            response: response.body,
            data: {
              "username": userName,
              "password": password,
            },
            endPoint: response.request!.url.toString(),
            headers: headers);
      }, onError: (error) {
        log("error happened from SignUp ${error.toString()}");
        onError(error.toString());
      });
    } catch (e) {
      log("error happened from SignUp ${e.toString()}");
      onError(e.toString());
    }
  }}