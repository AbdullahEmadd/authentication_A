import 'package:first_task/utility/app_colors.dart';
import 'package:first_task/utility/app_names.dart';
import 'package:flutter/material.dart';
import 'package:first_task/utility/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: false,
        leadingWidth: 0.0,
        title: Transform.scale(
          scaleX: -1,
          child: Image(image: AssetImage('assets/images/logo.png'),
            width: 80,
            height: 80,
          ),
        ),
        actions:[
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward_ios_outlined,
            color: Colors.black),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              AppNames.welcome,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Almarai',
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              AppNames.login,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Almarai',
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
