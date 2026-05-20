import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project/app/pages/auth/congratulation/congratulation_page.dart';
import 'package:project/app/pages/auth/forgotPassword/forgotPassword_page.dart';
import 'package:project/app/pages/auth/forgotPassword/otp.dart';
import 'package:project/app/pages/auth/resetPassword/resetPassword.dart';
import 'package:project/app/pages/auth/signup/signup_page.dart';
import 'package:project/app/pages/checkout/checkout_screen.dart';
import 'package:project/app/pages/checkout/payment_screen.dart';
import 'package:project/app/pages/checkout/review_screen.dart';
import 'package:project/app/pages/main/cart/cart_screen.dart';
import 'package:project/app/pages/main/detail_product/detail_screen.dart';
import 'package:project/app/pages/main/filter/filter_screen.dart';
import 'package:project/app/pages/main/getStarted/getStarted.dart';
import 'package:project/app/pages/main/home/home.dart';
import 'package:project/app/pages/auth/login/login_page.dart';
import 'package:project/app/pages/welcome/welcomePage.dart';

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
      initialRoute: "/home",
      routes: {
        "/": (context) => WelcomePage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/forgot": (context) => ForgotpasswordPage(),
        "/verification" : (context) => OtpPage(),
          "/reset": (context) => ResetPasswordPage(),
          "/congratulation"     : (context) => CongratulationPage(),
          "/getStarted"     : (context) => GetstartedPage(),
          "/filter"     : (context) => FilterScreen(),
          "/detail"     : (context) => DetailScreen(),
          "/cart"       : (context) => MyCart(),
          "/checkout"    : (context) => CheckoutScreen(),          
          "/payment"    : (context) => PaymentMethodsScreen(),      
          "/review"    : (context) => ReviewScreen(),          
    
      },
      
    ),
    
  );
}
