import 'dart:developer';
import 'package:first_task/models/authentication/enter_code_model.dart';
import 'package:first_task/requests/enter_code_request/enter_code_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'enter_code_state.dart';
class EnterCodeCubit extends Cubit<EnterCodeState> {
  EnterCodeCubit(): super(EnterCodeInitial());
  final EnterCodeKey = GlobalKey<FormState>();
  static EnterCodeCubit get(context) => BlocProvider.of(context);
  EnterCodeModel enterCodeModel = EnterCodeModel();
  var code = TextEditingController();
  var userName = TextEditingController();
  enterCode({required String code, required String userName}) {
    emit(EnterCodeLoading());
    EnterCodeRequest.enterCode(code: code, userName: userName, onSuccess:
    (EnterCodeModel){
      this.enterCodeModel = enterCodeModel;
      emit(EnterCodeDone(enterCodeModel));
      print(state);
    }
        , onError: (error){
          log("from the cubit :: : : ::  \n $error");
          emit(EnterCodeError(error));
        },
    );
  }
}