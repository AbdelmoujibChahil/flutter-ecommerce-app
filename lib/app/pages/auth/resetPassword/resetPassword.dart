import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/auth/loginController/loginController.dart';
import 'package:project/app/controllers/auth/resetController/resetController.dart';
import 'package:project/app/pages/auth/resetPassword/resetPassword_Form.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/app/pages/auth/login/login_form.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});

  final ResetController controller = Get.put(ResetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Column(
              children: [
                const TextComponent(
                  txt: "Enter New Password",
                  sizeFont: 35,
                  color: Colors.black,
                  fw: FontWeight.bold,
                  family: "Bold",
                  align: TextAlign.center,
                ),

                h(20),

                TextComponent(
                  txt:
                      "Your new password must be different from the previous password you used",
                  align: TextAlign.center,
                ),

                h(20),

                ResetPassordForm(
                  formKey: controller.formKey,
                  confirmationpasswordController:
                      controller.confimationPasswordController,
                  passwordController: controller.passwordController,
                  isLoading: controller.isLoading.value,
                  errorMessage: controller.errorMessage.value,
                  onSave: controller.resetPassword,
                ),
              ],
            )),
      ),
    );
  }
}