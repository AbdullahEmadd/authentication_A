import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/splash.png',
                height: 330,
              ),
            ],
          ),
          const SizedBox(
            height: 90,
          ),
          Transform.scale(
            scale: 0.5,
            child: Image.asset(
              'assets/images/logo.png'
            ),
          ),
          Image.asset(
              'assets/images/get_start.png'
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: Text(
                    'We show the easy way to shop just\n stay where you are',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
