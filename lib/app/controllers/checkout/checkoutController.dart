import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/Checkout/checkout.dart';

class CheckoutController extends GetxController {

  // Form fields
  final nameController = TextEditingController();
  final postalController = TextEditingController();
  final phoneController = TextEditingController();

  // Dropdowns
  final selectedCity = 'Rangpur'.obs;
  final selectedDistrict = 'Kurigram'.obs;

  final cities = [
    'Dhaka',
    'Chittagong',
    'Rangpur',
    'Sylhet',
    'Rajshahi'
  ];

  final districts = [
    'Kurigram',
    'Gaibandha',
    'Nilphamari',
    'Lalmonirhat',
    'Dinajpur'
  ];

  // Step indicator
  final currentStep = 1.obs;
  final totalSteps = 4;

  @override
  void onInit() {
    super.onInit();

    nameController.text = 'Ripon Ahmed';
    postalController.text = '9776';
    phoneController.text = '012 0000000';
  }

  @override
  void onClose() {

    nameController.dispose();
    postalController.dispose();
    phoneController.dispose();

    super.onClose();
  }

  // Convert form data → model
  CheckoutModel getCheckoutData() {

    return CheckoutModel(

      customerName: nameController.text,

      city: selectedCity.value,

      district: selectedDistrict.value,

      postalCode: postalController.text,

      phone: phoneController.text,
    );
  }

  void onNext() {

    if (currentStep.value < totalSteps) {

      currentStep.value++;

    } else {

      final checkoutData = getCheckoutData();

      print(checkoutData.toJson());

      Get.snackbar(
        'Checkout',
        'Order placed successfully!',
        backgroundColor: const Color(0xFF3D3DC8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}