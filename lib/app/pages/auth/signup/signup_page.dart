import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/auth/loginController/loginController.dart';
import 'package:project/app/controllers/auth/signupController/signupController.dart';
import 'package:project/app/pages/auth/signup/signup_form.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/app/pages/auth/login/login_form.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Signupcontroller controller = Get.put(Signupcontroller());

    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextComponent(
              txt: "Sign Up Now",
              sizeFont: 35,
              color: Colors.black,
              fw: FontWeight.bold,
              family: "Bold",
              align: TextAlign.center,
            ),
            h(20),
            SignupForm(
              formKey: controller.formKey,
              emailController: controller.emailController,
              telController:controller.telController,
              passwordController: controller.passwordController,
              isLoading: controller.isLoading.value,
              errorMessage: controller.errorMessage.value,
              onSignup: controller.signup,
            ),
          ],
        ),
      ),
    );
  }
}