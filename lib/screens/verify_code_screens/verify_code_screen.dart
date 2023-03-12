import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../components/button.dart';
import '../../components/custom_text_field.dart';
import '../../cubits/sign_up/sign_up_cubit.dart';
import '../../helpers/Validation.dart';
import '../../utility/app_names.dart';
import '../managers_screens/manager_home_screen.dart';

class VerifyCodeScreen extends StatefulWidget {


  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  SignUpCubit signUpCubit = SignUpCubit();
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
                  key: signUpCubit.VerifyCodeKey,
                  child: CustomTextField(
                    textFieldVaidType: TextFieldvalidatorType.EnterCode,
                    hint: AppNames.code,
                    controller: SignUpCubit.get(context).codeController,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) async{
                        if(state is VerifyCodeDone) {
                          if (state.verifyCodeModel.state == true) {
                            Get.snackbar('Success', state.verifyCodeModel.message![0].value.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ManagerHomeScreen()),
                            );
                          }
                          else {
                            Get.snackbar('Error', state.verifyCodeModel.message![0].value.toString());
                          }
                        }
                      },
                      builder: (context, state) {
                        return state is! VerifyCodeLoading? Button(
                            text: AppNames.next,
                            function: () {
                              if (signUpCubit.VerifyCodeKey.currentState?.validate() ==true) {
                                SignUpCubit.get(context).verifyCode();
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
