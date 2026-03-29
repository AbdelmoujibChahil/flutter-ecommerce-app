import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/controllers/main/productController/ProductController.dart';
import 'package:project/app/pages/components/Products_components.dart';
import 'package:project/app/pages/components/cart_component/cartBadge_component.dart';
import 'package:project/app/pages/components/elementsBar_component.dart';
import 'package:project/app/pages/components/formField_component.dart';
import 'package:project/app/pages/components/icon_component/icon_component.dart';
import 'package:project/app/pages/components/image_Component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());

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

                h(10),

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
            controller:  controller.searchController,
            hintText: "Search your product",
            prefixIcon: const Icon(Icons.search),
            border: false,
          ),
        ),
      ),
      const SizedBox(width: 10), 
          Obx(() => Stack(
                children: [
                  iconComponent(
                    Icons.shopping_bag_outlined,
                    const Color(0xFFF1E3C8),
                    () {},
                  ),

                  if (cartController.cartItems.isNotEmpty)
                    buildCartBadge(cartController),
                ],
              ))
      ,
    ],
  );
}
Widget _buildCategorySelector() {
  return Row(
    children: [
   Obx(() => ElementsbarComponent(
  list: controller.categories,
  selectedIndex: controller.selectedIndex.value,
  onSelect: controller.selectCategory,
)),
      IconButton(
         onPressed: () async {
              final filters = await Get.toNamed('/filter');

         if (filters != null) {
               controller.applyFilters(filters);
    }
  },
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
        onPressed: () {
           // REDIRECT PAGE ALL
        },
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
          child: CategoryBox(type.name, type.image),
        );
      },
    ),
  );
}
Widget _buildProductGrid() {
  return Obx(() => Wrap(
        spacing: 10,
        runSpacing: 10,
      children: controller.filteredProducts.map((p) {
  return productCard(
    p,
   () => cartController.addToCartFromHome(p),

    ///  NAVIGATE
    onTap: () => Get.toNamed('/detail', arguments: p), 
  );
}).toList(),
      ));
}
}