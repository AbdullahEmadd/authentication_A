import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_task/cubits/enter_code/enter_code_cubit.dart';
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
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  forgetPassword() async{
    emit(ForgetPasswordLoading());
    ForgetPasswordReturnModel? forgetPasswordReturnModel = await ForgetPasswordController.forgetPassword(
        userName: userNameController.text,
        );
    if (forgetPasswordReturnModel != null) {
      emit(ForgetPasswordDone(forgetPasswordReturnModel));
    }
    else {
      emit(ForgetPasswordError(""));
    }
  }
  codeConfirmation() async{
    emit(CodeConfirmationLoading());
    EnterCodeModel? enterCodeModel = await ForgetPasswordController.codeConfirmation(
        code: codeController.text,
        userName: userNameController.text,);
    if (enterCodeModel != null) {
      emit(CodeConfirmationDone(enterCodeModel));
    }
    else {
      emit(CodeConfirmationError(""));
    }
  }
  resetPassword() async{
    emit(ResetPasswordLoading());
    EnterNewPasswordModel? enterNewPasswordModel = await ForgetPasswordController.resetPasswordRequest(
        password: passwordController.text,
        passwordConfirmation:passwordConfirmationController.text ,
        userName: userNameController.text,);
    if (enterNewPasswordModel != null) {
      emit(ResetPasswordDone(enterNewPasswordModel));
    }
    else {
      emit(ResetPasswordError(""));
    }
  }

  regenerateCode() async{
    emit(RegenerateCodeLoading());
    RegenerateCodeModel? regenerateCodeModel = await ForgetPasswordController.regenerateCodeRequest(
        userName: userNameController.text,
    );
    if (regenerateCodeModel !=null ) {
      emit(RegenerateCodeDone(regenerateCodeModel));
    }
    else {
      emit(RegenerateCodeError(""));
    }
  }
}
