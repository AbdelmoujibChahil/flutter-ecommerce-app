import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/auth/forgotPasswordController.dart';
import 'package:project/app/controllers/auth/otpController.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/utils/colors.dart';

class OtpPage extends StatelessWidget {
 final otpController = Get.put(OtpController());
  final forgotController = Get.find<Forgotpasswordcontroller>();

  OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Enter Verification Code",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
    Text(
              "We sent a code to ${forgotController.emailController.text}",
              textAlign: TextAlign.center,
            ),
  

            const SizedBox(height: 30),

            // OTP BOXES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    controller: otpController.controllers[index],
                    focusNode: otpController.focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) =>
                        otpController.onChanged(value, index),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            //  ERROR
            Obx(() => otpController.errorMessage.value != null
                ? Text(
                    otpController.errorMessage.value!,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox()),

            const SizedBox(height: 20),

            // TIMER + RESEND
            Obx(() => otpController.seconds.value > 0
                ? Text("Resend in ${otpController.seconds.value}s")
                : TextButton(
                    onPressed: otpController.resendCode,
                    child: const Text("Resend Code"),
                  )),

            const SizedBox(height: 20),

            //  BUTTON
            Obx(() => otpController.isLoading.value
                ? const CircularProgressIndicator()
                : 
                ButtonComponent(txt: "verify",
                 bgColor: mainColor,
                 onPressed: otpController.verifyOtp,
)
                ),
          ],
        ),
      ),
    );
  }
}