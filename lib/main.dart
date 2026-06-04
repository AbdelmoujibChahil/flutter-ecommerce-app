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
import 'package:project/app/pages/main/seeAll/see_all_screen.dart';
import 'package:project/app/pages/notification/notification_screen.dart';
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

      initialRoute: "/home",

      getPages: [
          GetPage(
            name: "/",
            page: () => WelcomePage(),
          ),

          GetPage(
            name: "/login",
            page: () => LoginPage(),
            middlewares: [GuestMiddleware()],
          ),

          GetPage(
            name: "/signup",
            page: () => SignupPage(),
            middlewares: [GuestMiddleware()],
          ),

          GetPage(
            name: "/forgot",
            page: () => ForgotpasswordPage(),
            middlewares: [GuestMiddleware()],
          ),

          GetPage(
            name: "/verification",
            page: () => OtpPage(),
            middlewares: [GuestMiddleware()],
          ),

          GetPage(
            name: "/reset",
            page: () => ResetPasswordPage(),
            middlewares: [GuestMiddleware()],
          ),

          GetPage(
            name: "/congratulation",
            page: () => CongratulationPage(),
            middlewares: [GuestMiddleware()],
          ),

          GetPage(
            name: "/getStarted",
            page: () => GetstartedPage(),
            middlewares: [GuestMiddleware()],
          ),

          GetPage(
            name: "/home",
            page: () => HomePage(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/filter",
            page: () => FilterScreen(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/detail",
            page: () => DetailScreen(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/cart",
            page: () => MyCart(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/checkout",
            page: () => CheckoutScreen(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/payment",
            page: () => PaymentMethodsScreen(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/review",
            page: () => ReviewScreen(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/edit-profile",
            page: () => EditProfileScreen(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/notification",
            page: () => NotificationScreen(),
            middlewares: [AuthMiddleware()],
          ),

          GetPage(
            name: "/seeAll",
            page: () => SeeAllProductScreen(),
            middlewares: [AuthMiddleware()],
          ),
],
    );
  }
}