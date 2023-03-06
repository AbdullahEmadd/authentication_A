import 'package:first_task/utility/app_names.dart';
import 'package:first_task/utility/app_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
enum TextFieldvalidatorType{
  Email,
  EmailNotRequire,
  Password,
  LoginPassword,
  ConfirmPassword,
  PhoneNumber,
  OnceText,
  NormalText,
  MoreLine,
  IdNumberSudia,
  IdNumberNotSudia,
  RegisterText,
  None
}
Validation({required TextFieldvalidatorType type, required String value}){
  if(type==TextFieldvalidatorType.PhoneNumber){
    if(value.isEmpty)
    {
      return  AppNames.required;
    }
    else  if(value.length!=11)
    {
      return  AppNames.digitNumber;
    }
    else  if(value[0]!=0.toString()||value[1]!=5.toString())
    {
      return  AppNames.invalidPhone;
    }
    else if (!PhoneregExp.hasMatch(value)) {
      // else if (double.parse(value)==null) {
      return AppNames.invalidPhone;
    }
  }
  else if(type==TextFieldvalidatorType.Email) {

    if (value.isEmpty) {
      return  AppNames.required;
    }
    else {
      return null;
    }
  }else if(type==TextFieldvalidatorType.EmailNotRequire) {

    if (value.isEmpty) {
      return null;
    }
    else  if (!emailregExp.hasMatch(value)) {
      return  AppNames.invalidEmail;
    } else {
      return null;
    }
  }
  else if(type==TextFieldvalidatorType.Password) {

    if(value.isEmpty) {
      return AppNames.required;
    } else  if (value.length<6) {
      return AppNames.lessThan6;
    }
    else  if (value.length>30) {
      return AppNames.moreThan30;
    }else return null;
  }

  // else if(type==TextFieldvalidatorType.ConfirmPassword){
  //   print(value);
  //   print(firstPAsswordForConfirm);
  //   if(value.isEmpty){
  //     return AppNames.required;
  //   }
  //   else  if(value!=firstPAsswordForConfirm){
  //     return AppNames.DontMatched;
  //   }else{
  //     return null;
  //   }
  //
  // }

  // else if(type==TextFieldvalidatorType.IdNumberSudia){
  //   if(value.isEmpty){
  //     return AppNames.required;
  //   }
  //   else  if(!value.startsWith('1')){
  //     return AppNames.entervaildidnumber;
  //   }
  //   else  if(value.length!=10){
  //     return AppNames.entervaildidnumber;
  //   }
  //   else  if(doubleyParse(value)==null){
  //     return AppNames.entervaildidnumber;
  //   }else{
  //     return null;
  //   }
  //
  // }
  // else if(type==TextFieldvalidatorType.IdNumberNotSudia){
  //   if(value.isEmpty){
  //     return AppNames.required;
  //   }
  //   else  if(!value.startsWith('2')){
  //     return AppNames.entervaildidnumber;
  //   }
  //   else  if(value.length!=10){
  //     return AppNames.entervaildidnumber;
  //   }
  //   else  if(doubleyParse(value)==null){
  //     return AppNames.entervaildidnumber;
  //   }else{
  //     return null;
  //   }
  //
  // }

  else if(type==TextFieldvalidatorType.RegisterText){
    if(value.isEmpty){
      return 'Must not be empty';
    }
    else  if (!onlystringCharacters.hasMatch(value)) {

      return 'Must not be empty';
    }
    else  if (value.length<2) {
      return AppNames.lessThan2;
    }
    else  if (value.length>20) {
      return AppNames.moreThan20;
    }

  }

  else if(type==TextFieldvalidatorType.OnceText||type==TextFieldvalidatorType.LoginPassword){
    if(value.isEmpty)
    {
      return  AppNames.required;
    }

  }else if(type==TextFieldvalidatorType.None){
    return ;

  }


  else{
    if(value.isEmpty)
    {
      return  AppNames.required;
    }
    else  if (value.length<2) {
      return AppNames.lessThan2;
    }
    // else  if (value.length>20) {
    //   return AppNames.yourTextMustBeatmost20;
    // }
    return null;
  }

}