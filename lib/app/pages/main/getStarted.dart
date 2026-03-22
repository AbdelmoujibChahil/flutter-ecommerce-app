import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/image_Component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';
class GetstartedPage extends StatelessWidget {
  const GetstartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextComponent(
                txt: "Let's get started with shopping!",
                sizeFont: 30,
                fw: FontWeight.bold,
                align: TextAlign.center,
                family: "Bold",
              ),

              h(10),

              TextComponent(
                txt: "Find it here,buy it now!",
                sizeFont: 15,
                align: TextAlign.center,
              ),

              h(80),
            Container(
  child:ImageComponent(taille: 12, chemin: "assets/images/home.jpg"),
),
     h(50),          
              ButtonComponent(
                onPressed: () {
                  Get.offAllNamed("/home"); 
                },
                txt: "Get Started",
                bgColor: mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

