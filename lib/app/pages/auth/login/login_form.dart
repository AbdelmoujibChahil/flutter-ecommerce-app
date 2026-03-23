import 'package:flutter/material.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.errorMessage,
    required this.onLogin,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          h(20),
          FormfieldComponent(
            border: true,
            label: "email",
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          h(30),
          FormfieldComponent(
            border: true,
            label: "password",
            hide: true,
            typeInput: TextInputType.visiblePassword,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          h(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextComponent(txt: "Remember me"),
              w(90),
               TextButton(child:Text("Forgot Password") , onPressed: (){
                Navigator.pushNamed(context, "/forgot");
               })
            ],
          ),
          h(20),
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
                  onPressed: onLogin,
                  txt: "Log In",
                  bgColor: mainColor,
                ),
          h(80),
          Row(
            children: [
              Expanded(child: Container(height: 1, color: Colors.black38)),
              w(20),
              const TextComponent(txt: "Or Continue with"),
              w(20),
              Expanded(child: Container(height: 1, color: Colors.black38)),
            ],
          ),
          h(20),
          Row(
            children: [
            Expanded(
  child: Container(
    height: 60,
    child: OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SocialIcon(
            url: "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
          ),
          SizedBox(width: 10),
          Text("Google"),
        ],
      ),
    ),
  ),
),
              w(20),
          Expanded(
  child: Container(
    height: 60,
    child: OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SocialIcon(
            url: "https://cdn-icons-png.flaticon.com/512/124/124010.png",
          ),
          SizedBox(width: 10),
          Text("Facebook"),
        ],
      ),
    ),
  ),
),
            ],
          ),
          h(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextComponent(
                txt: "Don't have any account?",
                fw: FontWeight.bold,
              ),
              w(10),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/signup"),
                child: TextComponent(
                  txt: "Sign up",
                  family: "Bold",
                  color: mainColor,
                  fw: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: 24,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      },
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 24),
    );
  }
}