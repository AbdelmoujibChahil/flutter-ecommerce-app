import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/main/productController/CartController.sdart';
import 'package:project/app/controllers/main/productController/DetailController.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/icon_component/icon_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final detailController = Get.put(DetailController());
  final cartController = Get.put<CartController>(CartController());

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product;
    final images = product.images ?? [];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,

        /// BACK
        leading: iconComponent(
          Icons.arrow_back,
          Colors.white,
          () {
            detailController.reset();
            Get.back();
          },
        ),

        title: const TextComponent(
          txt: "Product Details",
          family: "Bold",
        ),
        centerTitle: true,

        /// CART ICON + BADGE
        actions: [
          Obx(() => Stack(
                children: [
                  iconComponent(
                    Icons.shopping_bag_outlined,
                    const Color(0xFFF1E3C8),
                    () {},
                  ),

                  if (cartController.cartItems.isNotEmpty)
                    _buildCartBadge(cartController),
                ],
              ))
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// IMAGE SLIDER
              _buildImageSlider(images),

              h(20),

              /// TITLE + ICONS
              Row(
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
                  )
                ],
              ),

              h(10),

              /// DESCRIPTION
              TextComponent(
                txt: product.description ?? "",
                sizeFont: 16,
                family: "Regular",
              ),

              h(20),

              /// PRICE
              Row(
                children: [
                  const Text(
                    "Tk 900",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  w(10),
                  Text(
                    "Tk ${product.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              h(20),
              _line(),

              h(20),

              /// SIZE
              const Text("Select Size", style: TextStyle(fontWeight: FontWeight.bold)),
              h(10),

              Obx(() => Wrap(
                    spacing: 10,
                    children: product.sizes.map((s) {
                      final isSelected =
                          detailController.selectedSize.value == s;

                      return ButtonComponent(
                        txt: s,
                        onPressed: () =>
                            detailController.selectSize(s),
                        width: 0.1,
                        padding: 10,
                        bgColor: isSelected ? mainColor : white,
                        textColor:
                            isSelected ? Colors.white : Colors.black,
                      );
                    }).toList(),
                  )),

              h(20),

              /// COLORS
              const Text("Select Color", style: TextStyle(fontWeight: FontWeight.bold)),
              h(10),

              Obx(() => Row(
                    children: product.colors.map((c) {
                      return _colorCircle(c);
                    }).toList(),
                  )),

              h(30),

              /// ADD TO CART
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 🖼 IMAGE SLIDER
  Widget _buildImageSlider(List<String> images) {
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
  Widget _colorCircle(Color color) {
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

  ///  BADGE
  Widget _buildCartBadge(CartController controller) {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Text(
          controller.cartItems.length.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _line() {
    return Container(
      height: 1,
      width: double.infinity,
      color: grey,
    );
  }
}