import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/authentication/forget_password_return_model.dart';
import '../../requests/forget_password_request/forget_password_request.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  ForgetPasswordReturnModel forgetPasswordReturnModel =
  ForgetPasswordReturnModel();

  forgetPassword() {
    emit(ForgetPasswordLoading());
    ForgetPasswordRequest.forgetPassword(
        userName: userNameController.text,
        onSuccess: (forgetPasswordModel) {
          forgetPasswordReturnModel = forgetPasswordModel;
          emit(ForgetPasswordDone());
        },
        onError: (e) {
          emit(ForgetPasswordError());
        });
  }

  codeConfirmation() {
    emit(CodeConfirmationLoading());
    ForgetPasswordRequest.codeConfirmation(
        code: codeController.text,
        userName: userNameController.text,
        onSuccess: () {
          emit(CodeConfirmationDone());
        },
        onError: (e) {
          emit(CodeConfirmationError());
        });
  }
  resetPassword() {
    emit(ResetPasswordLoading());
    ForgetPasswordRequest.resetPasswordRequest(
        password: passwordController.text,
        passwordConfirmation:passwordConfirmationController.text ,
        userName: userNameController.text,
        onSuccess: () {
          emit(ResetPasswordDone());
        },
        onError: (e) {
          emit(ResetPasswordError());
        });
  }
}
