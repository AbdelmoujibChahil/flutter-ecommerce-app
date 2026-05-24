import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/middleware/auth_middleware.dart';
import 'package:project/app/middleware/guest_middleware.dart';
import 'package:project/app/pages/auth/congratulation/congratulation_page.dart';
import 'package:project/app/pages/auth/forgotPassword/forgotPassword_page.dart';
import 'package:project/app/pages/auth/forgotPassword/otp.dart';
import 'package:project/app/pages/auth/login/login_page.dart';
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
import 'package:project/app/pages/profile/edit_profile_screen.dart';
import 'package:project/app/pages/welcome/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? pref;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  pref = await SharedPreferences.getInstance();
  Get.put(pref!);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      defaultTransition: Transition.leftToRightWithFade,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      initialRoute: "/",

      getPages: [

        GetPage(
          name: "/",
          page: () => WelcomePage(),
        ),

        GetPage(
          name: "/home",
          page: () => HomePage(),
        ),

        GetPage(
          name: "/login",
          page: () => LoginPage(),
        ),

        GetPage(
          name: "/signup",
          page: () => SignupPage(),
        ),

        GetPage(
          name: "/forgot",
          page: () => ForgotpasswordPage(),
        ),

        GetPage(
          name: "/verification",
          page: () => OtpPage(),
        ),

        GetPage(
          name: "/reset",
          page: () => ResetPasswordPage(),
        ),

        GetPage(
          name: "/congratulation",
          page: () => CongratulationPage(),
        ),

        GetPage(
          name: "/getStarted",
          page: () => GetstartedPage(),
        ),

        GetPage(
          name: "/filter",
          page: () => FilterScreen(),
        ),

        GetPage(
          name: "/detail",
          page: () => DetailScreen(),
        ),

        GetPage(
          name: "/cart",
          page: () => MyCart(),
        ),

        GetPage(
          name: "/checkout",
          page: () => CheckoutScreen(),
        ),

        GetPage(
          name: "/payment",
          page: () => PaymentMethodsScreen(),
        ),

        GetPage(
          name: "/review",
          page: () => ReviewScreen(),
        ),
       
        GetPage(
          name: "/edit-profile", 
          page: () => EditProfileScreen(),
        ),
      ],
    );
  }
}