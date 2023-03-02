// import 'dart:convert';
// import 'package:rahat_alosra/models/authentication/change_password.dart';
// import 'package:rahat_alosra/models/authentication/forgot_password.dart';
// import 'package:first_task/models/authentication/login.dart';
// import 'package:rahat_alosra/models/authentication/sign_up.dart';
// import 'package:rahat_alosra/models/authentication/verifiy_code.dart';
// import 'package:rahat_alosra/services/app_services.dart';
// import 'package:first_task/utility/app_setting.dart';
// import 'package:http/http.dart' as http;
// import 'dart:developer' as dev;
// import '../models/authentication/user_data.dart';
// /// SWAGGER ACCOUNT CONTROLLER
// class AccountController {
//
//   static Future<UserData?> loginUser({required Login login}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/login',
//         body: login.toJson());
//
//     return result !=null ?  UserData.fromJson(json.decode(result)) : null;
//   }
//
//   static Future<UserData?> verifyCode({VerifyCodePost? verifyCodePost}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/VerifyCode',
//         body: verifyCodePost);
//
//     return result != null ? UserData.fromJson(json.decode(result)) : null;
//   }
//
//   static Future<String?> reGenerateCode({ReGenerateCodePost? reGenerateCodePost}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/ReGenrateCode?IsSMSEnabled=true',
//         body: reGenerateCodePost);
//
//     return result != null ? result.toString().replaceAll('"', "") : null;
//   }
//
//   static Future<UserData?> verifyCodeTwoFactor({VerifyCodePost? verifyCodePost}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/VerifySignInCode',
//         body: verifyCodePost);
//
//     return result != null ? UserData.fromJson(json.decode(result)) : null;
//   }
//
//   static Future<String?> reGenerateCodeTwoFactor({ReGenerateCodePost? reGenerateCodePost}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/ReGenrateSignInCode?IsSMSEnabled=true',
//         body: reGenerateCodePost);
//
//     return result != null ? result.toString().replaceAll('"', "") : null;
//   }
//
//   static Future<SignUpUserResult?> register({ SignUpUserPost? signUpUserPost}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/register',
//         body: signUpUserPost);
//
//     return result != null ? SignUpUserResult.fromJson(json.decode(result)) : null;
//   }
//
//   static Future<String?> forgotPasswordGetCode({ ForgotPasswordPost? forgotPasswordPost}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/ForgotPassword?IsSMSEnabled=true',
//         body: forgotPasswordPost);
//
//     return result != null ? result.toString().replaceAll('"', "") : null;
//   }
//
//   static Future<String?> resetPassword({ ResetPasswordPost? resetPasswordPost}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/ResetPassword',
//         body: resetPasswordPost);
//
//     return result != null ? result.toString().replaceAll('"', "") : null;
//   }
//
//   static Future<String?> changePassword({ChangePassword? changePassword}) async {
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/ChangePassword',
//         body: changePassword);
//
//     return result != null ? result.toString().replaceAll('"', "") : null;
//   }
//
//   static Future<String?> editEmail({required String contactId , required String  email}) async {
//
//     var result = await AppService.callService(
//         actionType: ActionType.post,
//         apiName: 'api/account/EditEmail?contactId=$contactId&email=$email',
//         body: null);
//
//     return result != null ? result.toString().replaceAll('"', "") : null;
//   }
//
//   static Future translation({String? lang}) async {
//
//     var urlString="${AppSetting.serviceURL}Resources/$lang.json";
//     var url = Uri.parse(urlString);
//     var result = await http.get(url);
//     dev.log(url.toString() , name: "URL");
//     dev.log(result.statusCode.toString() , name: "STATUS CODE");
//     try{
//       if(result.statusCode == 200){
//         var getResult = json.decode(utf8.decode(result.bodyBytes));
//         dev.log(getResult.toString() , name: "RESOURCES");
//         return getResult != null ? getResult : null;
//       }else{
//         return null ;
//       }
//     }catch(e){
//       return null ;
//     }
//   }
// }