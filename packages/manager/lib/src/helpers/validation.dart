
enum TextFieldValidatorType {
  email,
  registerEmail,
  password,
  confirmPassword,
  phoneNumber,
  normalText,
  code,
  number,
  name,
  displayText,
  optional,
}

validation(
    {required TextFieldValidatorType type,
      required String value,
      required String firstPasswordForConfirm}) {
  if (type == TextFieldValidatorType.phoneNumber) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (value.length != 11) {
      return 'رقم الهاتف اقل من 11 ارقام';
    }
//    else if (!regExpPhone.hasMatch(value.arabicNumberToEnglish)) {
//      return 'رقم الهاتف غير صحيح';
//    }
    return null;
  } else if (type == TextFieldValidatorType.email) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (!regExpEmail.hasMatch(value)) {
      return 'هذا الاميل غير صحيح';
    } else {
      return null;
    }
  }  else if (type == TextFieldValidatorType.password) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (value.length < 6) {
      return 'لا يجب ان ايكون اقل من 6 ارقام';
    }  else {
      return null;
    }
  } else if (type == TextFieldValidatorType.confirmPassword) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (value != firstPasswordForConfirm) {
      return 'كلمه المرور غير متطابقه';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.code) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
  } else if (type == TextFieldValidatorType.optional) {
    return null;
  } else if (type == TextFieldValidatorType.number) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.length != 11) {
      return 'Must be equal 10';
    }
  } else if (type == TextFieldValidatorType.displayText) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.length < 2) {
      return 'يجب ان يكون اكثر من حرفين';
    }
  } else if (type == TextFieldValidatorType.name) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.length < 2) {
      return 'يجب ان يكون اكثر من حرفين';
    }
    if (value.length > 20) {
      return 'الاسم تجاوز 20 حرف';
    }

    if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
      return 'برجاء ادخال اسم صحيح';
    }

    return null;
  } else {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }
}

RegExp regExpName =  RegExp(
  r"^[\p{L} ,.'-]*$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);

RegExp regExpEmail =  RegExp(
  r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))+$',
  caseSensitive: false,
  multiLine: false,
);
