import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project/app/controllers/checkout/checkoutController.dart';
import 'package:project/app/controllers/checkout/PaymentController.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/models/Checkout/order.dart';

import 'package:project/app/pages/checkout/checkout_component.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/main/cart/price_item.dart';
import 'package:project/app/services/order_service.dart';

import 'package:project/utils/colors.dart';

class ReviewScreen extends StatelessWidget {

  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
final cartController = Get.find<CartController>();
    final checkoutCtrl =
        Get.find<CheckoutController>();

    final paymentCtrl =
        Get.find<PaymentController>();

    final checkoutData =
        checkoutCtrl.getCheckoutData();

    final paymentData =
        paymentCtrl.getPaymentData();

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
            onPressed: () {
            checkoutCtrl.currentStep.value = 2;
            Get.back();
            }    ,
        ),

        title: const Text(
          'Review Order',
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
                  current:
                      checkoutCtrl.currentStep.value,
                  total:
                      checkoutCtrl.totalSteps,
                )),
          ),

          Expanded(
            child: SingleChildScrollView(

              padding: const EdgeInsets.all(24),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Shipping Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  _reviewItem(
                    "Name",
                    checkoutData.customerName,
                  ),

                  _reviewItem(
                    "City",
                    checkoutData.city,
                  ),

                  _reviewItem(
                    "District",
                    checkoutData.district,
                  ),

                  _reviewItem(
                    "Postal Code",
                    checkoutData.postalCode,
                  ),

                  _reviewItem(
                    "Phone",
                    checkoutData.phone,
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  _reviewItem(
                    "Method",
                    paymentData.paymentMethod,
                  ),
                  
                ],
              ),
            ),
          ),
Padding(padding: EdgeInsets.symmetric(horizontal: 24),
child: 
             Obx(()=> Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: PriceItem(
                  subTitle: "Sub total",
                  value: cartController.calculeTotal().toStringAsFixed(2),
                ))),) ,
          Padding(
            padding: const EdgeInsets.fromLTRB(
              24,
              8,
              24,
              32,
            ),

            child: ButtonComponent(

              txt: "Confirm Order",

              bgColor: mainColor,

           onPressed: () async {

                try {

                  OrderModel order = OrderModel(

                    checkout: checkoutData,

                    payment: paymentData,

                    total: cartController.calculeTotal(),
                  );

              /*    OrderService orderService =
                      OrderService();

                  bool success =
                      await orderService.order(order);*/

                  if (true) {

                    Get.snackbar(
                      "Success",
                      "Order confirmed",
                      backgroundColor: mainColor,
                      colorText: Colors.white,
                    );

                    cartController.cartItems.clear();
                  checkoutCtrl.currentStep.value = 1;
                  Get.offAllNamed("/home");

                  } else {

                    Get.snackbar(
                      "Error",
                      "Failed to place order",
                    );
                  }

                } catch (e) {

                  Get.snackbar(
                    "Error",
                    e.toString(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewItem(
    String title,
    String value,
  ) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),

          Text(value),
        ],
      ),
    );
  }
}