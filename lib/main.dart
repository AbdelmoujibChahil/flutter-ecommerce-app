import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project/app/pages/auth/forgotPassword/forgotPassword_page.dart';
import 'package:project/app/pages/auth/forgotPassword/otp.dart';
import 'package:project/app/pages/auth/resetPassword/resetPassword.dart';
import 'package:project/app/pages/auth/signup/signup_page.dart';
import 'package:project/home.dart';
import 'package:project/app/pages/auth/login/login_page.dart';
import 'package:project/app/pages/welcomePage.dart';

void main() {
  runApp(
    GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
        theme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomePage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/forgot": (context) => ForgotpasswordPage(),
        "/verification" : (context) => OtpPage(),
          "/reset": (context) => ResetPasswordPage(),

      },
      
    ),
    
  );
}
