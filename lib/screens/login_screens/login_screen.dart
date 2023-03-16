import 'package:first_task/components/custom_text.dart';
import 'package:first_task/components/loader_custom/loader_custom.dart';
import 'package:first_task/helpers/Validation.dart';
import 'package:first_task/helpers/cache_helper.dart';
import 'package:first_task/routes/routes.dart';
import 'package:first_task/screens/login_screens/login_view_model.dart';
import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = LoginViewModel();
  bool _obscure = true;
  void _toggle() {
    setState(() {
      _obscure = !_obscure;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: Padding(
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
                    if (Navigator.canPop(context)) {
                      goBack();
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: loginViewModel.formKey,
                    child: Column(children: [
                      SizedBox(
                        height: 130.h,
                      ),
                      CustomText(
                          text: AppNames.welcome,
                          fontSize: 20.sp,
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.w),
                        child: CustomText(
                          text: AppNames.login,
                              fontSize: 15,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        textFieldVaidType: TextFieldvalidatorType.RegisterText,
                        controller: loginViewModel.userName,
                        hint: AppNames.userName,
                      ),
                      CustomTextField(
                        textFieldVaidType: TextFieldvalidatorType.Password,
                        obscure: _obscure,
                        icon:
                            _obscure ? Icons.visibility_off : Icons.visibility,
                        iconPressed: _toggle,
                        controller: loginViewModel.password,
                        hint: AppNames.password,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButton(
                        text: 'تسجيل الدخول',
                        function: () {
                          if (loginViewModel.formKey.currentState!.validate()) {
                            loginViewModel.userLogin(
                                userName: loginViewModel.userName.text,
                                password: loginViewModel.password.text);
                            CacheHelper.saveData(key: 'UserData', value: true);
                          }
                        },
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      TextButton(
                        onPressed: () {
                          goToScreen(
                              screenNames: ScreenNames.forgetPasswordScreen);
                        },
                        child: CustomText(
                          text: AppNames.forgetPassword,
                          fontSize: 14.sp,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           CustomText(
                            text: AppNames.haveCompany,
                            fontSize: 16.sp,
                             color: AppColors.black,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () {
                              goToScreen(screenNames: ScreenNames.signUpScreen);
                            },
                            child: CustomText(
                                text:AppNames.registerAsAdmin,
                                  color: AppColors.mainColor,
                                  fontSize: 16.sp,),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            )),
        Loader(
          loading: loginViewModel.loading,
        )
      ],
    );
  }
}
