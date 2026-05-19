
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/controllers/main/productController/DetailController.dart';
import 'package:project/app/pages/components/appBar_component/appBar_component.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/app/pages/main/cart/cart_item_component.dart';
import 'package:project/app/pages/main/cart/price_item.dart';
import 'package:project/utils/colors.dart';

class MyCart extends StatelessWidget {
   MyCart({super.key});

  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: buildAppBar(null, cartController, "My Cart"),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child:
               
        Obx(()
        {
             if (cartController.cartItems.isEmpty) {
            return const Center(
            child: Text("Your cart is empty"),
            );
        }

    return ListView(
              children: [
                ...List.generate(
                    cartController.cartItems.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: 
                          CartItem(
                            index: index,
                           onPressedAdd: () { cartController.increaseQuantity(index);  },
                           cartController: cartController,
                           onPressedRemove: () { cartController.decreaseQuantity(index);  }),
                        )),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextButton.icon(
                      onPressed: () {
                        Get.toNamed("/home");
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add more items"),
                    ),
                  ),
                ),
              ],
            );})),

            Obx(()=> Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: PriceItem(
                  subTitle: "Sub total",
                  value: cartController.calculeTotal().toStringAsFixed(2),
                ))),

            const Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: PriceItem(
                  subTitle: "Taxes and Fees",
                  value: "10.00",
                )),
            const Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: PriceItem(
                  subTitle: "Delivery Fee",
                  value: "5.00",
                )),

            // DOTTED DIVIDER LINES
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: List.generate(
                  40,
                  (index) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                    Obx(() => Text(
                            "${(cartController.calculeTotal() + 15).toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                            ),
                            )),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ButtonComponent(
                  onPressed: () {
                    if(cartController.cartItems.isEmpty){
                      Get.snackbar("Error", "Your cart is empty");
                      return;

                    }
                    Get.toNamed("/checkout");
                  },
                  txt: "Checkout",
                   bgColor: mainColor,
                ),
              ),
            )

            // CART ITEMS TOTAL
          ],
        ),
      ),
    );
  }
  
}