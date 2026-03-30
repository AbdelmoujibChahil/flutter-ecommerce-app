import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/controllers/main/productController/DetailController.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/app/pages/main/detail_product/detail_screen_components.dart';
class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final detailController = Get.put(DetailController());
  final cartController = Get.put<CartController>(CartController());

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product;
    final images = product.images ?? [];

    return Scaffold(
      appBar: buildAppBar(  detailController, cartController),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageSlider(images, detailController),
            h(20),
            buildTitleRow(product),
            h(10),
            TextComponent(
              txt: product.description ?? "",
              sizeFont: 16,
              family: "Regular",
            ),
            h(20),
            buildPriceRow(product),
            h(20),
            line(),
            h(20),
            buildSizeSelector(product, detailController),
            h(20),
            buildColorSelector(product, detailController),
            h(30),
            buildAddToCartButton(product, detailController, cartController),
          ],
        ),
      ),
    );
  }

 
}