import 'package:bloc/bloc.dart';
import 'dart:developer';
import 'package:first_task/models/authentication/verify_code_model.dart';
import 'package:flutter/material.dart';
import '../../requests/verify_code_request/verify_code_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_task/cubits/verify_code/verify_code_state.dart';
class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(VerifyCodeInitial());
  var userName = TextEditingController();
  var password = TextEditingController();
  var code = TextEditingController();
  final VerifyCodeKey = GlobalKey<FormState>();
  static VerifyCodeCubit get(context) => BlocProvider.of(context);
  VerifyCodeModel verifyCodeModel = VerifyCodeModel();
  verifyCode({required String userName, required String password,
  required String code}) {
    emit(VerifyCodeLoading());
    VerifyCodeRequest.verify(
      userName: userName,
      password: password,
      code: code,
      onSuccess: (verifyCodeModel){
        this.verifyCodeModel = verifyCodeModel;
        emit(VerifyCodeDone(verifyCodeModel));
        print(state);
      },
      onError: (error) {
        log("from the cubit :: : : :: \n $error");
        emit(VerifyCodeError(error));
      },
    );
  }
}
