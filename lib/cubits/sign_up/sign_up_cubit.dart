import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/authentication/sign_up_model.dart';
import '../../models/authentication/verify_code_model.dart';
import '../../controller/sign_up_request/sign_up_request.dart';
import '../../controller/verify_code_request/verify_code_request.dart';
part 'sign_up_state.dart';
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final VerifyCodeKey = GlobalKey<FormState>();
  SignUpModel signUpModel=SignUpModel();
  VerifyCodeModel verifyCodeModel = VerifyCodeModel();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  adminSignUp(
      ) async{
    emit(SignUpLoading());
      SignUpModel? signUpModel = await SignUpController.signUp(
      userName: userNameController.text,
      password: passwordController.text,
      name: nameController.text,
      email: emailController.text,
      passwordConfirmation: passwordConfirmationController.text,
      phone: phoneController.text,
      role: 'Manager',
    );

    if (signUpModel != null) {
      emit(SignUpDone(signUpModel));
    } else {
      emit(SignUpError(""));
    }
  }

  verifyCode() {
    emit(VerifyCodeLoading());
    VerifyCodeRequest.verify(
      userName: userNameController.text,
      password: passwordController.text,
      code: codeController.text,
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