import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:project/app/controllers/auth/resetController/resetController.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class ResetPassordForm extends StatelessWidget {
  const ResetPassordForm({
    super.key,
    required this.formKey,
    required this.confirmationpasswordController,
    required this.passwordController,
    required this.isLoading,
    required this.errorMessage,
    required this.onSave,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController confirmationpasswordController;
  final TextEditingController passwordController;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetController>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          h(30),

          ///  PASSWORD
          Obx(() => FormfieldComponent(
                label: "Password",
                hide: controller.hidePassword.value,
                typeInput: TextInputType.visiblePassword,
                controller: passwordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.togglePassword,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              )),

          h(40),

          ///  CONFIRM PASSWORD
          Obx(() => FormfieldComponent(
                label: "Confirm Password",
                hide: controller.hideConfirmPassword.value,
                typeInput: TextInputType.visiblePassword,
                controller: confirmationpasswordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.hideConfirmPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.toggleConfirmPassword,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (value != passwordController.text) {
                    return 'Both Passwords must match';
                  }
                  return null;
                },
              )),

          h(40),

          if (errorMessage != null)
            TextComponent(
              txt: errorMessage!,
              color: Colors.red,
              align: TextAlign.center,
            ),

          h(10),

          isLoading
              ? const CircularProgressIndicator()
              : ButtonComponent(
                  onPressed: onSave,
                  txt: "Save",
                  bgColor: mainColor,
                ),

          h(80),
        ],
      ),
    );
  }
}