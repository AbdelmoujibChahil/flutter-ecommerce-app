import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class WelcomePage extends StatelessWidget {
   WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: welcomeBg,
      ),
      body: 
         Container(
          padding:  EdgeInsets.all(50),
          height: size.height,
          width: size.width,
          color: welcomeBg,
          child: Column(
            children: [
               TextComponent(
                txt: "Welcome",
                sizeFont: 30,
                fw: FontWeight.bold,
                align: TextAlign.center,
                family : "Bold",
              ),
               TextComponent(
                txt: "ManMode Shopping House",
                sizeFont: 18,
                fw: FontWeight.normal,
                align: TextAlign.center,

              ),
                   h(70),
                 _WelcomeImage(),
                   h(70),
              ButtonComponent(onPressed:(){Get.toNamed("/login"); } , txt: "Login", bgColor: mainColor),
                   h(20),
               ButtonComponent(onPressed:(){Get.toNamed('/signup');} , txt: "Sign Up", bgColor: loginButtonColor),
                   h(50),
               TextComponent(
                txt: "Not Thanks",
                sizeFont: 15,
                fw: FontWeight.normal,
                align: TextAlign.center,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      
    );
  }
}

class _WelcomeImage extends StatelessWidget {
   _WelcomeImage();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn-icons-png.flaticon.com/512/1170/1170576.png",
      scale: 2.5,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return  CircularProgressIndicator();
      },
      errorBuilder: (context, error, stackTrace) {
        return  Icon(Icons.error);
      },
    );
  }
}