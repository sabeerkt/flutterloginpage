import 'package:flutter/material.dart';
import 'package:login/screen/splash.dart';

// ignore: constant_identifier_names
const String SAVE_KEY_NAME = 'UserLoggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOGIN',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScreenSplash(),
    );
  }
}
