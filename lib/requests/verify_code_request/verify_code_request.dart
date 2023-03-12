import 'dart:convert';
import 'dart:developer';
import '../../models/authentication/login_model.dart';
import '../../models/authentication/verify_code_model.dart';
import '../../services/global_helper_method.dart';
import '../../utility/app_consts.dart';
import 'package:http/http.dart' as http;

class VerifyCodeRequest{
  static verify({required String userName ,
    required String password ,
    required String code,
    required Function(VerifyCodeModel verifyCodeModel) onSuccess,
    required Function(String error) onError})async{
    try {
      //API Calling
      // String token = await getToken();
      var headers = {...apiHeaders};
      // "Authorization" : token,
      await http.post(
          getUri('${AppConsts.baseUrl}Account/VerifyCode'),
          headers: headers,
          body: json.encode({
            "Username": userName,
            "Password": password,
            "Code": code,
          })
      ).then((response) async{
        log(response.body + "\n" + response.statusCode.toString());
        // modiling
        if (response.statusCode==200) {
          VerifyCodeModel verifyCodeModel= VerifyCodeModel.fromJson(json.decode(response.body));
          onSuccess(verifyCodeModel);
        }
        else {
          log(response.body);
        }
        // Debugging API response
        debugApi(
            methodName: "Verify Code",
            statusCode: response.statusCode,
            response: response.body,
            data: {
              "Username": userName,
              "Password": password,
              "Code": code,
            },
            endPoint: response.request!.url.toString(),
            headers: headers);
      }, onError: (error) {
        log("error happened from Verify Code ${error.toString()}");
        onError(error.toString());
      });
    }catch(e){
      log("error happened from Verify Code ${e.toString()}");
      onError(e.toString());
    }
  }}