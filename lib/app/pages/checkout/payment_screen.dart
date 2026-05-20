import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:project/app/controllers/checkout/PaymentController.dart';
import 'package:project/app/controllers/checkout/checkoutController.dart';
import 'package:project/app/pages/checkout/checkout_component.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/utils/colors.dart';
class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final ctrl = Get.find<CheckoutController>();
    final ctrlPayment = Get.put(PaymentController());

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            ctrl.currentStep.value = 1;
            Get.back();
            }        ),
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

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),

            child: Obx(() => StepIndicator(
                  current: ctrl.currentStep.value,
                  total: ctrl.totalSteps,
                )),
          ),

          const Text(
            'Select Payment Method',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),

         child: ListView.separated(
              itemCount: ctrlPayment.paymentMethods.length,

              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: Colors.grey.shade300,
              ),

              itemBuilder: (context, index) {

                final item = ctrlPayment.paymentMethods[index];

                return ListTile(

                  leading: Icon(
                    item['icon'] as IconData,
                    color: Colors.black87,
                  ),

                  title: Text(
                    item['title'].toString(),
                  ),

                  trailing: Obx(() => Radio<String>(
                        value: item['title'].toString(),

                        groupValue:
                            ctrlPayment.selectedPayment.value,

                        activeColor: const Color(0xFF3D3DC8),

                        onChanged: (value) {
                          ctrlPayment.selectedPayment.value = value!;
                        },
                  )),
                );
              },
            )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),

            child: ButtonComponent(
              txt: "Next",
              bgColor: mainColor,

              onPressed: () {

                ctrl.onNext();

                Get.toNamed("/review");
               },
            ),
          ),
        ],
      ),
    );
  }
}