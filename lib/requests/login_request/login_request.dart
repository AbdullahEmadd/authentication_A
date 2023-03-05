import 'dart:convert';
import 'dart:developer';
import '../../models/authentication/login_model.dart';
import '../../services/global_helper_method.dart';
import '../../utility/app_consts.dart';
import 'package:http/http.dart' as http;

class LoginRequest{
  static login({required String userName ,
    required String password ,
    required Function(LoginModel loginModel) onSuccess,required Function(String error) onError})async{
    try {
      //API Calling

      // String token = await getToken();
      var headers = {...apiHeaders};
      // "Authorization" : token,
      await http.post(
          getUri('${AppConsts.baseUrl}Account/Login'),
          headers: headers,
          body: json.encode({
            "username": userName,
            "password": password,
          })
      ).then((response) async{
        log(response.body + "\n" + response.statusCode.toString());
        // modiling
        if (response.statusCode==200) {
          LoginModel loginModel= LoginModel.fromJson(json.decode(response.body));
          onSuccess(loginModel);
        }
        else {
          log(response.body);
        }
        // Debugging API response
        debugApi(
            methodName: "login",
            statusCode: response.statusCode,
            response: response.body,
            data: {
              "username": userName,
              "password": password,
            },
            endPoint: response.request!.url.toString(),
            headers: headers);
      }, onError: (error) {
        log("error happened from Login ${error.toString()}");
        onError(error.toString());
      });
    }catch(e){
      log("error happened from Login ${e.toString()}");
      onError(e.toString());
    }
  }}