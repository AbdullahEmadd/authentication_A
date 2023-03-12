part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
}
class ForgetPasswordInitial extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class ForgetPasswordLoading extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class ForgetPasswordDone extends ForgetPasswordState {
  final ForgetPasswordReturnModel forgetpasswordreturnmodel;
  ForgetPasswordDone(this.forgetpasswordreturnmodel);
  @override
  List<Object> get props => [];
}class ForgetPasswordError extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class CodeConfirmationLoading extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class CodeConfirmationDone extends ForgetPasswordState {
  final EnterCodeModel enterCodeModel;
  CodeConfirmationDone(this.enterCodeModel);
  @override
  List<Object> get props => [];
}class CodeConfirmationError extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class ResetPasswordLoading extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class ResetPasswordDone extends ForgetPasswordState {
  final EnterNewPasswordModel enterNewPasswordModel;
  ResetPasswordDone(this.enterNewPasswordModel);
  @override
  List<Object> get props => [];
}class ResetPasswordError extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class RegenerateCodeLoading extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}class RegenerateCodeDone extends ForgetPasswordState {
  final RegenerateCodeModel regenerateCodeModel;
  RegenerateCodeDone(this.regenerateCodeModel);
  @override
  List<Object> get props => [];
}class RegenerateCodeError extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}
