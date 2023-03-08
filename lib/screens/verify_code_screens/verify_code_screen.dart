import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../components/button.dart';
import '../../components/custom_text_field.dart';
import '../../cubits/verify_code/verify_code_cubit.dart';
import '../../cubits/verify_code/verify_code_state.dart';
import '../../helpers/Validation.dart';
import '../../utility/app_names.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  VerifyCodeCubit verifyCodeCubit = VerifyCodeCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Transform.scale(
            scaleX: -1,
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: 80,
              height: 80,
            ),
          ),
        ),
        elevation: 0,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Transform.scale(
              scaleX: -1,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: 80,
                height: 80,
              ),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                const Text(
                  AppNames.enterCode,
                  style: TextStyle(
                      fontFamily: 'Almarai',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Form(
                  key: verifyCodeCubit.VerifyCodeKey,
                  child: CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.EnterCode,
                    hint: AppNames.code,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
                      listener: (context, state) async{
                        if(state is VerifyCodeDone) {
                          if (state.verifyCodeModel.state == true) {
                            Get.snackbar('تم', state.verifyCodeModel.message![0].value.toString());
                            // Navigator.push(context, MaterialPageRoute(builder: (builder)=>EnterNewPasswordScreen()));
                          }
                          else {
                            Get.snackbar('Message', state.verifyCodeModel.message![0].value.toString());
                          }
                        }
                      },
                      builder: (context, state) {
                        return state is! VerifyCodeLoading? Button(
                            text: AppNames.next,
                            function: () {
                              if (verifyCodeCubit.VerifyCodeKey.currentState?.validate() ==true) {
                                VerifyCodeCubit.get(context).verifyCode(code:
                                VerifyCodeCubit.get(context).code.text
                                    , userName:
                                    VerifyCodeCubit.get(context).userName.text,
                                password: VerifyCodeCubit.get(context).password.text);
                              }
                            }
                        ): CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
