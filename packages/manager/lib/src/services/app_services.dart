import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manager/src/utility/app_setting.dart';

class AppService {
  static Future callService({
      required ActionType actionType,
      required String apiName,
      required body}) async {
    var apiUrl = Uri.parse(
        "${AppSetting.serviceURL}${AppSetting.globalLang}/api/$apiName");

    var header = {
      "content-type": 'application/json',
    };

    dev.log(apiUrl.toString(), name: "URL");
    dev.log(json.encode(header).toString(), name: "HEADER");
    dev.log(json.encode(body).toString(), name: "BODY");

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response response = actionType == ActionType.get
            ? await http.get(apiUrl, headers: header)
            : await http.post(apiUrl, headers: header, body: json.encode(body));

        dev.log(response.statusCode.toString(), name: "STATUS CODE");
        dev.log(response.body.toString(), name: "RESULT");

        /// USER UN AUTHORIZE
        if (response.statusCode == 401) {
          /// DO SOMETHING (go to login screen)
          return null;
        } else {
          if (response.statusCode == 200 &&
              jsonDecode(response.body)["State"]) {
            // print(response.body);
            // print(jsonDecode(response.body)["Data"]);
            // print(jsonDecode(response.body)["Data"].runtimeType);
            return  jsonDecode(response.body)["Data"];
          } else {
            Get.snackbar('عفوا', jsonDecode(response.body)["Message"][0]["Value"].toString());
            return null;
          }
        }
      } else {
        return null;
      }
    } catch (message) {
      dev.log(message.toString(), name: "CATCH ERROR");
      return null;
    }
  }
}

enum ActionType { get, post }
