import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = Rx<String?>(null);

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    errorMessage.value = null;

    bool success = await _authService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    isLoading.value = false;

    if (success) {
      Get.offAllNamed('/home');
    } else {
      errorMessage.value = 'Login failed. Please check your credentials.';
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}