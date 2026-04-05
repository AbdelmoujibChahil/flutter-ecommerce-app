 //APPBAR
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/controllers/main/productController/DetailController.dart';
import 'package:project/app/pages/components/cart_component/cartBadge_component.dart';
import 'package:project/app/pages/components/icon_component/icon_component.dart';
import 'package:project/app/pages/components/text_component.dart';

AppBar buildAppBar(DetailController? detailController,CartController cartController,String title ) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: iconComponent(Icons.arrow_back, Colors.white, () {
        detailController?.reset();
        Get.back();
      }),
      title: TextComponent(
        txt: title,
        family: "Bold",
      ),
      centerTitle: true,
      actions: [
        Obx(() => Stack(
              children: [
                iconComponent(Icons.shopping_bag_outlined,
                    const Color(0xFFF1E3C8), () {
                      Get.toNamed("/cart");
                    }),
                if (cartController.cartItems.isNotEmpty)
                  buildCartBadge(cartController),
              ],
            ))
      ],
    );
  }