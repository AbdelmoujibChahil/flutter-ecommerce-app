import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/Products/product.dart';

class CartController extends GetxController {

  var cartItems = <Map<String, dynamic>>[].obs;

  Map<String, dynamic> prepareOrder(
      Product product, String size, Color? color) {

    return {
      "product_id": product.id,
      "size": size,
      "color": color == null
          ? null
          : "#${color.value.toRadixString(16).substring(2).toUpperCase()}",
      "quantity": 1,
    };
  }

  void addToCart(Product product, String size, Color? color) {
    final order = prepareOrder(product, size, color);

    final exists = cartItems.any((item) =>
        item["product_id"] == order["product_id"] &&
        item["size"] == order["size"] &&
        item["color"] == order["color"]);

    if (exists) {
      Get.snackbar("Info", "Already in cart");
      return;
    }

    cartItems.add(order);

    Get.snackbar("Success", "Product added to cart");
  }



 Map<String, dynamic> prepareOrderFromHome(Product product) {
    return {
      "product_id": product.id,
      "name": product.name,
      "price": product.price,
      "size": product.sizes.isNotEmpty ? product.sizes.first : null,
      "color": _colorToHex(
        product.colors.isNotEmpty ? product.colors.first : null,
      ),
      "quantity": 1,
    };
  }


    void addToCartFromHome(Product product) {
    final order = prepareOrderFromHome(product);

    _add(order);
  }

void _add(Map<String, dynamic> order) {
    final exists = cartItems.any((item) =>
        item["product_id"] == order["product_id"] &&
        item["size"] == order["size"] &&
        item["color"] == order["color"]);

    if (exists) {
      Get.snackbar("Info", "Already in cart");
      return;
    }

    cartItems.add(order);

    Get.snackbar("Success", "Product added to cart");
  }

  String? _colorToHex(Color? color) {
    return color == null
        ? null
        : "#${color.value.toRadixString(16).substring(2).toUpperCase()}";
  }

}