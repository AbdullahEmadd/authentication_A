import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/authentication/sign_up_model.dart';
import '../../requests/sign_up_request/sign_up_request.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  List<String> roles = [];
  SignUpModel signUpModel=SignUpModel();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
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
      email: emailController.text,passwordConfirmation: passwordConfirmationController.text,
      phone: phoneController.text,
      role: 'Admin',
      onSuccess: (signUpModel) {
        this.signUpModel  = signUpModel;
        emit(SignUpDone());
      },
      onError: (error) {
        log("from the cubit :: : : ::  \n $error");
        emit(SignUpError());
      },
    );
  }
}