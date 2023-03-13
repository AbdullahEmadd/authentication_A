import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/authentication/login_model.dart';
import '../../requests/login_request/login_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/cache_helper.dart';
part 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  List<String> roles = [];
  LoginModel loginModel = LoginModel();
  var userName = TextEditingController();
  var password = TextEditingController();


  userLogin({required String userName, required String password}) {
    emit(LoginLoading());
    LoginRequest.login(
      userName: userName,
      password: password,
      onSuccess: (loginModel) {
        this.loginModel = loginModel;
        emit(LoginDone(loginModel));
        print(state);
        CacheHelper.saveData(key: 'UserData', value: jsonEncode(loginModel));
      },
      onError: (error) {
        log("from the cubit :: : : ::  \n $error");
        emit(LoginError(error));
      },
    );
  }
}
