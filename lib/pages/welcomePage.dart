import 'package:flutter/material.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/text_component.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
decoration: BoxDecoration(
  color: Color( 0xFFE0E0E0),
),
        child: Column(
          children: [
            SizedBox(height: 100),
               TextComponent(txt: "Welcome", sizeFont: 50, fw: FontWeight.bold,align: TextAlign.center),
              TextComponent(txt: "ManMode Shopping", sizeFont: 15, fw: FontWeight.normal,align: TextAlign.center,),
             SizedBox(height: 20),
              Image.network("https://cdn-icons-png.flaticon.com/512/1170/1170576.png",scale: 1.5,),
           SizedBox(height: 40),
           ButtonComponent(route: "/login", txt: "Login"),
           SizedBox(height: 20,)
           ,
             ButtonComponent(route: "/signup", txt: "Sign Up"),
             SizedBox( height: 50,),
              TextComponent(txt: "Not Thanks", sizeFont: 15, fw: FontWeight.normal,align: TextAlign.center, color: const Color.fromARGB(255, 0, 0, 0))

          ],
        ),
      ),
    );
  }
}