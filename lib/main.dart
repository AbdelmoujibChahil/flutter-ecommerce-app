import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:project/app/pages/forgotPassword/forgotPassword_page.dart';
import 'package:project/app/pages/auth/signup.dart';
import 'package:project/home.dart';
import 'package:project/app/pages/auth/login_page.dart';
import 'package:project/app/pages/welcomePage.dart';

void main() {
  runApp(MaterialApp(
    home: WelcomePage(),
    debugShowCheckedModeBanner: false,
    routes: {
      "/home": (context) => HomePage(),
      "/login": (context) => LoginPage(),
      "/signup": (context) => SignupPage(),
      "/forgot": (context) => ForgotpasswordPage(),
    },
  ));
}

