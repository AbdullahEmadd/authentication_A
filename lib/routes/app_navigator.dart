part of 'routes.dart';

goToScreen({required String screenNames, Object? arguments }) {

  FocusScope.of(Get.context!).unfocus();
  Navigator.pushNamed(Get.context!, screenNames, arguments: arguments  );
}

goToScreenpopAndPushNamed({required String screenNames, Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();
  Navigator.popAndPushNamed(Get.context!, screenNames, arguments: arguments);
}

goToScreenPushNamedAndpop({required String screenNames, Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();
  Navigator.pushReplacementNamed(Get.context!, screenNames, arguments: arguments);
}

goBack({Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();
  Navigator.pop(Get.context! , arguments );
}

goToWithRemoveRoute({required String screenNames, Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();
  Navigator.of(Get.context!).pushNamedAndRemoveUntil(
      screenNames, (Route<dynamic> route) => false);
  // Navigator.pushNamed(Get.context, screenNames);
}
popUntilScreen({required String screenNames}) {
  FocusScope.of(Get.context!).unfocus();
  Navigator.of(Get.context!)
      .popUntil(ModalRoute.withName(screenNames));
}



goToIntro({required String screenNames, Object? arguments}) {
  // FocusScope.of(Get.context).unfocus();
  // Navigator.of(Get.context).pushNamedAndRemoveUntil(screenNames, (Route<dynamic> route) => false);
  // Navigator.pushNamed(Get.context, screenNames);

  FocusScope.of(Get.context!).unfocus();
  // Navigator.of(Get.context).pushNamedAndRemoveUntil(screenName, (Route<dynamic> route) => false);
  Get.offNamedUntil(screenNames, (route) => false);
}

goPopUntil({required String screenNames, Object? arguments}) {
  FocusScope.of(Get.context!).unfocus();
  Navigator.of(Get.context!).popUntil(ModalRoute.withName(screenNames));
}
