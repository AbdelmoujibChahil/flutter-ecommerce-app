import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/auth/loginController/loginController.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/app/pages/auth/login/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextComponent(
              txt: "Sign in Now",
              sizeFont: 35,
              color: Colors.black,
              fw: FontWeight.bold,
              family: "Bold",
              align: TextAlign.center,
            ),
            h(20),
            LoginForm(
              formKey: controller.formKey,
              emailController: controller.emailController,
              passwordController: controller.passwordController,
              isLoading: controller.isLoading.value,
              errorMessage: controller.errorMessage.value,
              onLogin: controller.login,
            ),
          ],
        ),
      ),
    );
  }
}