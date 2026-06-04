import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:project/app/controllers/checkout/checkoutController.dart';
import 'package:project/app/pages/checkout/checkout_component.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/utils/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(CheckoutController());
 
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ── Step indicator 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Obx(() => StepIndicator(
                  current: ctrl.currentStep.value,
                  total: ctrl.totalSteps,
                )),
          ),
 
          // ── Title 
          const Text(
            'Shipping Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
 
          const SizedBox(height: 24),
 
          // ── Form 
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldLabel('Name'),
                  InputField(
                    controller: ctrl.nameController,
                    hint: 'Full name',
                  ),
                  const SizedBox(height: 20),
 
                  FieldLabel('Town/City'),
                  Obx(() => DropdownField(
                        value: ctrl.selectedCity.value,
                        items: ctrl.cities,
                        onChanged: (v) => ctrl.selectedCity.value = v!,
                      )),
                  const SizedBox(height: 20),
 
                  FieldLabel('Postal Code'),
                  InputField(
                    controller: ctrl.postalController,
                    hint: 'Postal code',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
 
                  FieldLabel('District'),
                  Obx(() => DropdownField(
                        value: ctrl.selectedDistrict.value,
                        items: ctrl.districts,
                        onChanged: (v) => ctrl.selectedDistrict.value = v!,
                      )),
                  const SizedBox(height: 20),
 
                  FieldLabel('Phone'),
                  InputField(
                    controller: ctrl.phoneController,
                    hint: 'Phone number',
                    keyboardType: TextInputType.phone,
                  ),
 
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
 
          // ── Next button 
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: ctrl.onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child:  ButtonComponent(txt: "Next", bgColor: mainColor, onPressed: (){  ctrl.currentStep.value ++;Get.toNamed("/payment");})
              ),
            ),
          ),
        ],
      ),
    );
    
  }
  
}

 