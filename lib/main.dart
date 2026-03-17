import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project/app/pages/forgotPassword/forgotPassword_page.dart';
import 'package:project/app/pages/auth/signup_page.dart';
import 'package:project/home.dart';
import 'package:project/app/pages/auth/login_page.dart';
import 'package:project/app/pages/welcomePage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomePage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/forgot": (context) => ForgotpasswordPage(),
      },
    ),
  );
}
