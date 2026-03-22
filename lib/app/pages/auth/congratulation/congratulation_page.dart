import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';
class CongratulationPage extends StatelessWidget {
  const CongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: welcomeBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/verifier.png",
                scale: 2.5,
              ),

              h(50),

              TextComponent(
                txt: "Congratulations!",
                sizeFont: 30,
                fw: FontWeight.bold,
                align: TextAlign.center,
                family: "Bold",
              ),

              h(10),

              TextComponent(
                txt: "Your account has been successfully created",
                sizeFont: 15,
                align: TextAlign.center,
              ),

              h(80),

              ButtonComponent(
                onPressed: () {
                  Get.offAllNamed("/home"); 
                },
                txt: "Continue Shopping",
                bgColor: mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

