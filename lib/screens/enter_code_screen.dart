import 'dart:developer';
import 'package:first_task/components/custom_text_field.dart';
import 'package:first_task/cubits/enter_code/enter_code_cubit.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../utility/app_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'enter_new_password_screen.dart';
class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);
  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  EnterCodeCubit entercodecubit = EnterCodeCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leadingWidth: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Transform.scale(
                scaleX: -1,
                child: Image(image: AssetImage('assets/images/logo.png'),
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
              icon: Icon(Icons.arrow_back_ios,
                  color: Colors.black),
            ),
          )
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
                  key: entercodecubit.EnterCodeKey,
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
                    BlocProvider(
                      create: (context) => EnterCodeCubit(),
                      child: BlocConsumer<EnterCodeCubit, EnterCodeState>(
                      listener: (context, state) async{
                        if(state is EnterCodeDone) {
                          if (state.enterCodeModel.state == true) {
                            Get.snackbar('تم', state.enterCodeModel.message![0].value.toString());
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>EnterNewPasswordScreen()));
                          }
                          else {
                            Get.snackbar('Message', state.enterCodeModel.message![0].value.toString());
                          }
                        }
                      },
                      builder: (context, state) {
                        return state is! EnterCodeLoading? Button(
                            text: AppNames.next,
                            function: () {
                              if (entercodecubit.EnterCodeKey.currentState?.validate() ==true) {
                                EnterCodeCubit.get(context).enterCode(code:
                                    EnterCodeCubit.get(context).code.text
                                    , userName:
                                EnterCodeCubit.get(context).userName.text);
                              }
                            }
                        ): CircularProgressIndicator();
                      },
                    ),
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
