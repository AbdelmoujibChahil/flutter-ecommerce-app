/// ================= EDIT PROFILE PAGE =================

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/profile/editProfileController.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class EditProfileScreen extends StatelessWidget {

  EditProfileScreen({super.key});

  final controller =
      Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,

        centerTitle: true,

        title: TextComponent(
          txt: "Edit Profile",
          fw: FontWeight.bold,
        ),
      ),

      body: Obx(() {

        if (controller.isLoading.value &&
            controller.user.value == null) {

          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return  SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              /// PROFILE IMAGE
              Stack(
                children: [

                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: mainColor,
                        width: 3,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/home.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        /// PICK IMAGE
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: mainColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              h(30),

              /// NAME
              Align(
                alignment: Alignment.centerLeft,
                child: TextComponent(
                  txt: "Full Name",
                  fw: FontWeight.w600,
                ),
              ),

              h(10),

              FormfieldComponent(
                border: true,
                controller: controller.nameController,
                hintText: controller.nameController.text ??  "Enter your name",
                prefixIcon: const Icon(Icons.person_outline),
              ),

              h(20),

              /// EMAIL
              Align(
                alignment: Alignment.centerLeft,
                child: TextComponent(
                  txt: "Email",
                  fw: FontWeight.w600,
                ),
              ),

              h(10),

              FormfieldComponent(
                                border: true,

                controller: controller.emailController,
                hintText: controller.emailController.text ?? "Enter your email",
                prefixIcon: const Icon(Icons.email_outlined),
              ),

              h(20),

              /// PHONE
              Align(
                alignment: Alignment.centerLeft,
                child: TextComponent(
                  txt: "Phone Number",
                  fw: FontWeight.w600,
                ),
              ),

              h(10),

              FormfieldComponent(
                                border: true,

                controller: controller.phoneController,
                hintText: controller.phoneController.text ?? "Enter your phone number",
                prefixIcon: const Icon(Icons.phone_outlined),
              ),

              h(40),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  onPressed: () {
                    controller.updateProfile();
                  },

                  child: TextComponent(
                    txt: "Save Changes",
                    color: Colors.white,
                    fw: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      }),
    );
  }
}