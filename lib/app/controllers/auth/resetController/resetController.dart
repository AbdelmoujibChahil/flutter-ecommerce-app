import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/services/auth_service.dart';

class ResetController extends GetxController {
  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confimationPasswordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = Rx<String?>(null);
  var hidePassword = true.obs;
  var hideConfirmPassword = true.obs;

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void toggleConfirmPassword() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    errorMessage.value = null;

  /* 
   bool success = await _authService.resetPassword(
      passwordController.text.trim(),
      confimationPasswordController.text.trim(),
    );*/

//For testing
   dynamic success= true;
    isLoading.value = false;

    if (success) {
      Get.offAllNamed('/congratulation');
    } else {
      errorMessage.value = 'Login failed. Please check your credentials.';
    }
  }

  @override
  void onClose() {
    confimationPasswordController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}