import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:project/app/controllers/auth/forgotPasswordController.dart';
import 'package:project/app/pages/auth/forgotPassword/forgotPasswordForm.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class ForgotpasswordPage extends StatelessWidget {
  
  const ForgotpasswordPage({super.key});
        

   
  @override
  Widget build(BuildContext context) {
        final Forgotpasswordcontroller controller = Get.put(Forgotpasswordcontroller());

    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextComponent(
              txt: "Forget Password",
              sizeFont: 35,
              color: Colors.black,
              fw: FontWeight.bold,
              family: "Bold",
              align: TextAlign.center,
            ),
            h(20),
           TextComponent(txt: "Don't worry! It occurs.Please enter the email address linked with your account",align: TextAlign.center,),
           h(40),
           Image.asset("assets/images/forgot.png",scale: 2.5,),
          h(40),
           Obx(() => ForgotpasswordForm(
  formKey: controller.formKey,
  emailController: controller.emailController,
  isLoading: controller.isLoading.value,
  errorMessage: controller.errorMessage.value,
  onSend: controller.sendCode,
))
          ],
        ),
      ),
    );
  }
}