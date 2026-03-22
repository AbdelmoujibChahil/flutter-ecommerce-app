import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:project/app/controllers/main/productController/homeProductController.dart';
import 'package:project/app/models/Products/Category.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/models/Products/type.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/Products_components.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/image_Component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),

                _buildHeader(),

                h(20),

                _buildCategorySelector(),

                h(20),

                _buildBanner(),

                h(10),

                _buildSectionHeader("Categories"),

                _buildTypeList(),

                h(20),

                _buildSectionHeader("All Product"),

                _buildProductGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: FormfieldComponent(
            hintText: "Search your product",
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
      const SizedBox(width: 10),
      CircleAvatar(
        radius: 25,
        backgroundColor: grey,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      )
    ],
  );
}
Widget _buildCategorySelector() {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final cat = controller.categories[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Obx(() => ButtonComponent(
                      txt: cat.nom,
                      width: 0.2,
                      padding: 5,
                      bgColor: controller.selectedIndex.value == index
                          ? mainColor
                          : white,
                      textColor: controller.selectedIndex.value == index
                          ? white
                          : Colors.black,
                      onPressed: () =>
                          controller.selectCategory(index),
                    )),
              );
            },
          ),
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
      )
    ],
  );
}

Widget _buildBanner() {
  return ImageComponent(
    taille: 12,
    chemin: "assets/images/home.jpg",
  );
}
Widget _buildSectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextComponent(
        txt: title,
        fw: FontWeight.bold,
        family: "Bold",
      ),
      TextButton(
        onPressed: () {},
        child: TextComponent(
          txt: "See all",
          color: mainColor,
          fw: FontWeight.bold,
        ),
      )
    ],
  );
}
Widget _buildTypeList() {
  return SizedBox(
    height: 100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.types.length,
      itemBuilder: (context, index) {
        final type = controller.types[index];

        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CategoryBox(type.nom, type.image),
        );
      },
    ),
  );
}
Widget _buildProductGrid() {
  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children: controller.products
        .map((p) => productCard(p))
        .toList(),
  );
}}