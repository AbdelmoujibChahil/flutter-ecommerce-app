import 'package:flutter/material.dart';
import 'package:project/app/pages/components/text_component.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  
    Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: TextComponent(txt: "hah"),
    ) ,
    );
    
  
  }
}