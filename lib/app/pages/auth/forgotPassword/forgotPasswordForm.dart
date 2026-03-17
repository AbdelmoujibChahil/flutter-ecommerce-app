import 'package:flutter/material.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class ForgotpasswordForm extends StatelessWidget {
  const ForgotpasswordForm({
    required this.formKey,
    required this.emailController,
    required this.isLoading,
    required this.errorMessage,
    required this.onSend,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          h(20),
          FormfieldComponent(
            label: "Email/Phone",
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
            if (!RegExp(r'(^[^@]+@[^@]+\.[^@]+$)|(^[0-9]{10,}$)').hasMatch(value)){
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
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
                  onPressed: onSend,
                  txt: "Send",
                  bgColor: mainColor,
                ),
        ],
      ),
    );
  }
}

