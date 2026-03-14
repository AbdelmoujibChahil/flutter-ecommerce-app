import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:project/pages/login.dart';
import 'package:project/pages/signup.dart';
import 'package:project/pages/welcomePage.dart';
void main() {
  runApp(MaterialApp(
    home: WelcomePage(),
    debugShowCheckedModeBanner: false,
    routes: {
      "/home": (context) => HomePage(),
      "/login": (context) => LoginPage(),
      "/signup": (context) => SignupPage(),
    },
  ));
}

