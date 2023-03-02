import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'package:first_task/utility/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Task',
      theme: ThemeData(fontFamily: 'Almarai'),
      home: HomePage());

  }
}
