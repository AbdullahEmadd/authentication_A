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
  @override
  List<Object> get props => [];
}

