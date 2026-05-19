
  import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/controllers/main/productController/DetailController.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/icon_component/icon_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';


//TITLE ROW
  Widget buildTitleRow(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextComponent(
            txt: product.name,
            sizeFont: 26,
            family: "Bold",
          ),
        ),
        Row(
          children: [
            iconComponent(Icons.favorite_border, grey, () {}),
            w(10),
            iconComponent(Icons.share, grey, () {}),
          ],
        ),
      ],
    );
  }

//PRICE and OLDPRICE
  Widget buildPriceRow(Product product) {
    return Row(
      children: [
        if (product.oldPrice != null)
          Text(
            "DH ${product.oldPrice}",
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
        w(10),
        Text(
          "DH ${product.price}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

//SIZE SELECTOR
  Widget buildSizeSelector(Product product,DetailController detailController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Size", style: TextStyle(fontWeight: FontWeight.bold)),
        h(10),
        Obx(() => Wrap(
              spacing: 10,
              children: product.sizes.map((size) {
                final isSelected = detailController.selectedSize.value == size;
                return ButtonComponent(
                  txt: size,
                  onPressed: () => detailController.selectSize(size),
                  width: 0.1,
                  padding: 10,
                  bgColor: isSelected ? mainColor : white,
                  textColor: isSelected ? Colors.white : Colors.black,
                );
              }).toList(),
            )),
      ],
    );
  }

//COLOR SELECTOR
  Widget buildColorSelector(Product product,DetailController detailController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Color", style: TextStyle(fontWeight: FontWeight.bold)),
        h(10),
        Obx(() => Row(
              children: product.colors
                  .map((color) => colorCircle(color, detailController))
                  .toList(),
            )),
      ],
    );
  }

//ADD TO CART BUTTON
  Widget buildAddToCartButton(Product product,DetailController detailController,CartController cartController) {
    return Row(
      children: [
        Expanded(
          child: ButtonComponent(
            width: 0.1,
            bgColor: mainColor,
            txt: "Add to Cart",
            onPressed: () {
              if (detailController.selectedSize.value.isEmpty) {
                Get.snackbar("Error", "Please select size");
                return;
              }
              if (detailController.selectedColor.value == null) {
                Get.snackbar("Error", "Please select color");
                return;
              }
              cartController.addToCart(
                product,
                detailController.selectedSize.value,
                detailController.selectedColor.value,
              );
            },
          ),
        ),
      ],
    );
  }

/// IMAGE SLIDER
  Widget buildImageSlider(List<String> images,DetailController detailController) {
    if (images.isEmpty) {
      return const SizedBox(
        height: 250,
        child: Center(child: Text("No image")),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: detailController.changeImage,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        /// DOTS
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                final isActive =
                    detailController.currentImageIndex.value == index;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 10 : 8,
                  height: isActive ? 10 : 8,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.blue : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            )),
      ],
    );
  }

  ///  COLOR
  Widget colorCircle(Color color,DetailController detailController) {
    final isSelected =
        detailController.selectedColor.value == color;

    return GestureDetector(
      onTap: () => detailController.selectColor(color),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: Colors.black, width: 3)
              : null,
        ),
      ),
    );
  }


  Widget line() {
    return Container(
      height: 1,
      width: double.infinity,
      color: grey,
    );
  }
