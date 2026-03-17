import 'package:flutter/material.dart';

class FormfieldComponent extends StatelessWidget {
  final String label;
  final TextInputType typeInput;
  final bool hide;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;


  const FormfieldComponent({
    super.key,
    required this.label,
    this.hide = false,
    this.typeInput = TextInputType.emailAddress,
    this.controller,
    this.validator,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: typeInput,
      obscureText: hide,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: hide ? const Icon(Icons.remove_red_eye) : null,
      ),
      validator: validator ?? (value) {
        if (value!.isEmpty) {
          return "Please enter your $label";
        }
        return null;
      },
    );
  }
}