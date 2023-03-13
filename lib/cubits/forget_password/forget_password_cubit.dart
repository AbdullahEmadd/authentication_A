import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_task/models/authentication/enter_new_password_model.dart';
import 'package:first_task/models/authentication/regenerate_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/authentication/enter_code_model.dart';
import '../../models/authentication/forget_password_return_model.dart';
import '../../controller/forget_password_request/forget_password_request.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  final ForgetKey = GlobalKey<FormState>();
  final EnterCodeKey = GlobalKey<FormState>();
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  ForgetPasswordReturnModel forgetPasswordReturnModel =
  ForgetPasswordReturnModel();
  EnterCodeModel enterCodeModel = EnterCodeModel();
  EnterNewPasswordModel enterNewPasswordModel = EnterNewPasswordModel();

  forgetPassword() {
    emit(ForgetPasswordLoading());
    ForgetPasswordRequest.forgetPassword(
        userName: userNameController.text,
        onSuccess: (forgetPasswordModel) {
          forgetPasswordReturnModel = forgetPasswordModel;
          emit(ForgetPasswordDone(forgetPasswordModel));
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
        onSuccess: (enterCodeModel) {
          emit(CodeConfirmationDone(enterCodeModel));
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
        onSuccess: (enterNewPasswordModel) {
          emit(ResetPasswordDone(enterNewPasswordModel));
        },
        onError: (e) {
          emit(ResetPasswordError());
        });
  }

  regenerateCode(){
    emit(RegenerateCodeLoading());
    ForgetPasswordRequest.regenerateCodeRequest(userName: userNameController.text,
        onSuccess: (regenerateCodeModel){
      emit(RegenerateCodeDone(regenerateCodeModel));
        }, onError: (e) {
          emit(ResetPasswordError());
        } );
  }
}
