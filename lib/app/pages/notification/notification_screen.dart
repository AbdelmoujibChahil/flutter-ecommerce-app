
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/pages/components/appBar_component/appBar_component.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF3D3DBF);
    const backgroundColor = Color(0xFFF8F8FC);
 
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar:AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
           icon: const Icon(Icons.arrow_back, color: Colors.black),
           onPressed: () {
           Get.back(); 
              },
            ),
        title: const Text("Notification", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(flex: 2),
 
            // Bell icon with circle background
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFEAEAF6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/Notication.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
 
            const SizedBox(height: 32),
 
           TextComponent(txt: "No Notification Here",sizeFont: 26,fw: FontWeight.w800,color: const Color(0xFF1A1A2E),align: TextAlign.center,),
 
            const SizedBox(height: 12),
 

            TextComponent(txt: "There is no notification to\nshow right now",sizeFont: 15,fw: FontWeight.w400,color: const Color(0xFF1A1A2E),align: TextAlign.center,),
 
            const Spacer(flex: 3),
 
           ButtonComponent(txt: "Go back to home",bgColor: mainColor,onPressed: () {Get.toNamed("/home");},width: double.maxFinite,),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}