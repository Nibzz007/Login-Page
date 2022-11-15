import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_sample/screens/splash.dart';


const  SAVE_KEY_NAME = 'userLogedIn';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Sample',
      // ignore: prefer_const_constructors
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: ScreenSplash(),
    );
  }
}