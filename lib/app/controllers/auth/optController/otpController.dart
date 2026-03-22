import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/services/auth_service.dart';

class OtpController extends GetxController {

  final AuthService _authService = AuthService();



  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
      List.generate(4, (_) => FocusNode());

  var isLoading = false.obs;
  var errorMessage = Rx<String?>(null);
  var seconds = 60.obs;

  String get otp =>
      controllers.map((e) => e.text).join();

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    seconds.value = 60;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (seconds.value == 0) return false;
      seconds.value--;
      return true;
    });
  }

  void onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

Future<void> verifyOtp() async {
  if (otp.length < 4) {
    errorMessage.value = "Enter full code";
    return;
  }

  isLoading.value = true;
  errorMessage.value = null;

 //api: bool success = await _authService.verifyOtp(otp);

  isLoading.value = false;
   bool success=true;
  if (success) {
    Get.offAllNamed('/reset');
  } else {
    errorMessage.value = "Invalid code";
  }
}

  void resendCode() {
    startTimer();
    errorMessage.value = null;
    // call API here
  }

  @override
  void onClose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}