part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}
class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];
}
class SignUpDone extends SignUpState {
  final SignUpModel signUpModel;
  SignUpDone(this.signUpModel);
  @override
  List<Object> get props => [];
}
class SignUpError extends SignUpState {
  String? error;
  SignUpError(this.error);
  @override
  List<Object> get props => [];
}class VerifyCodeLoading extends SignUpState {
  @override
  List<Object> get props =>[];
}class VerifyCodeDone extends SignUpState {
  final VerifyCodeModel verifyCodeModel;
  VerifyCodeDone(this.verifyCodeModel);
  @override
  List<Object> get props => [];
}class VerifyCodeError extends SignUpState {
  String? error;
  VerifyCodeError(this.error);
  @override
  List<Object> get props => [];
}

