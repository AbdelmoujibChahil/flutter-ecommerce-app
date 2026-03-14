import 'package:flutter/material.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/space_component.dart';
import 'package:project/components/text_component.dart';
import 'package:project/utils/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: welcomeBg,
      ),
      body: 
         Container(
          padding: const EdgeInsets.all(50),
          height: size.height,
          width: size.width,
          color: welcomeBg,
          child: Column(
            children: [
              const TextComponent(
                txt: "Welcome",
                sizeFont: 30,
                fw: FontWeight.bold,
                align: TextAlign.center,
                family : "Bold",
              ),
              const TextComponent(
                txt: "ManMode Shopping House",
                sizeFont: 18,
                fw: FontWeight.normal,
                align: TextAlign.center,

              ),
                   h(70),
                const _WelcomeImage(),
                   h(70),
              ButtonComponent(route: "/login", txt: "Login", bgColor: mainColor),
                   h(20),
               ButtonComponent(route: "/signup", txt: "Sign Up", bgColor: loginButtonColor),
                   h(50),
              const TextComponent(
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
  const _WelcomeImage();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn-icons-png.flaticon.com/512/1170/1170576.png",
      scale: 2.5,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const CircularProgressIndicator();
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}