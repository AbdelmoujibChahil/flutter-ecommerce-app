import 'package:flutter/material.dart';
import 'package:project/app/components/button_component.dart';
import 'package:project/app/components/formField_component.dart';
import 'package:project/app/components/space_component.dart';
import 'package:project/app/components/text_component.dart';
import 'package:project/utils/colors.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("")),
      body: Container(
        padding:  EdgeInsets.all(20),
        child:  Column(
          children: [
            TextComponent(
              txt: "Sign in Now",
              sizeFont: 35,
              color: Colors.black,
              fw: FontWeight.bold,
              family: "Bold",
              align: TextAlign.center,
            ),
            h(20),
            _LoginForm(),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
   _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          h(20),
           FormfieldComponent(label: "email"),
          h(30),
           FormfieldComponent(
            label: "password",
            hide: true,
            typeInput: TextInputType.visiblePassword,
          ),
          h(20),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent(txt: "Remember me"),
              w(90),
              TextComponent(txt: "Forgot password", color: mainColor),
            ],
          ),
          h(20),
          ButtonComponent(route: "/home", txt: "Log In", bgColor: mainColor),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(color: mainColor),
                  ),
          child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
          children:  [
               Image.network(
      "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
      width: 24,
    ),
            SizedBox(width: 10),
            Text("Google"),
          ],
        ),                ),
              ),
              w(20),
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(color: mainColor),
                  ),
                child: Row(
                  
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
               Image.network(
  "https://cdn-icons-png.flaticon.com/512/124/124010.png",
      width: 24,
    ),
            SizedBox(width: 10),
            Text("Facebook"),
          ],
        ),
                ),
              ),
            ],
          ),
          h(20),
           Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextComponent(txt: "Don't have any account?",fw: FontWeight.bold,),
            w(10)
            ,  TextComponent(
                txt: "Sign up",
                family: "Bold",
                color: mainColor,fw: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}