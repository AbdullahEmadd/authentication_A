import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/authentication/login_model.dart';
import '../../controller/login_request/login_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  userLogin({required String userName, required String password}) async {
    emit(LoginLoading());
    LoginModel? loginModel = await LoginController.login(
      userName: userName,
      password: password,
    );

    if (loginModel != null) {
      emit(LoginDone(loginModel));
    } else {
      emit(LoginError(""));
    }
  }
}
