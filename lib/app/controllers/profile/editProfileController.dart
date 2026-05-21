/// ================= EDIT PROFILE CONTROLLER =================

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/user/user.dart';
import 'package:project/app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {

  final UserService _userService = UserService();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  var isLoading = false.obs;

  Rx<UserModel?> user = Rx<UserModel?>(null);

  late SharedPreferences pref;

  @override
  void onInit() {

    super.onInit();

    pref = Get.find<SharedPreferences>();

    getProfile();
  }

  /// GET PROFILE
  Future<void> getProfile() async {

    try {

      isLoading.value = true;

      String token = pref.getString("token") ?? "";

      UserModel? response =
          await _userService.getProfile(token);

      if (response != null) {

        user.value = response;

        nameController.text = response.name;
        emailController.text = response.email;
        phoneController.text = response.phone;
      }

    } catch (e) {

      Get.snackbar(
        "Error",
        "Failed to load profile",
      );

    } finally {

      isLoading.value = false;
    }
  }

  /// UPDATE PROFILE
  Future<void> updateProfile() async {

    try {

      isLoading.value = true;

      String token = pref.getString("token") ?? "";

      bool success =
          await _userService.updateProfile(

        token: token,

        name: nameController.text.trim(),

        email: emailController.text.trim(),

        phone: phoneController.text.trim(),
      );

      if (success) {

        Get.snackbar(
          "Success",
          "Profile updated successfully",
        );

      } else {

        Get.snackbar(
          "Error",
          "Update failed",
        );
      }

    } catch (e) {

      Get.snackbar(
        "Error",
        "Server error",
      );

    } finally {

      isLoading.value = false;
    }
  }

  @override
  void onClose() {

    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}