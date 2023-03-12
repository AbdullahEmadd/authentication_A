import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/authentication/sign_up_model.dart';
import '../../models/authentication/verify_code_model.dart';
import '../../requests/sign_up_request/sign_up_request.dart';
import '../../requests/verify_code_request/verify_code_request.dart';
part 'sign_up_state.dart';
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  List<String> roles = [];
  final VerifyCodeKey = GlobalKey<FormState>();
  SignUpModel signUpModel=SignUpModel();
  VerifyCodeModel verifyCodeModel = VerifyCodeModel();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  adminSignUp(
      ) {
    emit(SignUpLoading());
    SignUpRequest.signUp(
      userName: userNameController.text,
      password: passwordController.text,
      name: nameController.text,
      email: emailController.text,
      passwordConfirmation: passwordConfirmationController.text,
      phone: phoneController.text,
      role: 'Manager',
      onSuccess: (signUpModel) {
        this.signUpModel  = signUpModel;
        emit(SignUpDone(signUpModel));
      },
      onError: (error) {
        log("from the cubit :: : : ::  \n $error");
        emit(SignUpError());
      },
    );
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