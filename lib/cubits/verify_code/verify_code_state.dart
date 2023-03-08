import 'package:equatable/equatable.dart';
import 'package:first_task/cubits/verify_code/verify_code_cubit.dart';

import '../../models/authentication/verify_code_model.dart';
abstract class VerifyCodeState extends Equatable {
  const VerifyCodeState();
}

class VerifyCodeInitial extends VerifyCodeState {
  @override
  List<Object> get props => [];
}class VerifyCodeLoading extends VerifyCodeState {
  @override
  List<Object> get props =>[];
}class VerifyCodeDone extends VerifyCodeState {
  final VerifyCodeModel verifyCodeModel;
  VerifyCodeDone(this.verifyCodeModel);
  @override
  List<Object> get props => [];
}class VerifyCodeError extends VerifyCodeState {
  String? error;
  VerifyCodeError(this.error);
  @override
  List<Object> get props => [];
}
