import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/services/auth_service.dart';

class Forgotpasswordcontroller extends GetxController {

  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = Rx<String?>(null);

  Future<void> sendCode() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    errorMessage.value = null;

try {
 /* bool success = await _authService.sendCode(
    emailController.text.trim(),
  );*/
   bool success = true;
  if (success) {
    Get.offAllNamed('/verification');
  } else {
    errorMessage.value = 'Email not found';
  }

} catch (e) {
  errorMessage.value = 'Server error';
}
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}