import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/services/auth_service.dart';

class Signupcontroller extends GetxController {
  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   final telController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = Rx<String?>(null);

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    errorMessage.value = null;

   /* bool success = await _authService.signup(
      emailController.text.trim(),
      passwordController.text.trim(),
        telController.text.trim()
    );*/

    //For testing
     dynamic success = true;
    isLoading.value = false;

    if (success) {
      print("succes");
      Get.offAllNamed('/home');
    } else {
      errorMessage.value = 'Signup failed. Please check your credentials.';
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    telController.dispose();
    super.onClose();
  }
}