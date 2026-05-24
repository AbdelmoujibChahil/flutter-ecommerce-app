import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:path/path.dart';
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
import 'package:project/main.dart';
import 'package:project/utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _buildDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),

                _buildHeader(context),

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

 Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Center(
                child: TextComponent(
                  txt: "Account",
                  fw: FontWeight.bold,
                ),
              ),

              h(30),

              /// ITEMS
              _drawerItem(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () {
                  Get.toNamed("/edit-profile");
                },
                isSelected: true,
              ),

              _drawerItem(
                icon: Icons.notifications_none,
                title: "Notification",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.location_on_outlined,
                title: "Order tracking sources",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.language,
                title: "Language",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.attach_money,
                title: "Currency",
                trailing: "BD Tk",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.info_outline,
                title: "Help Center",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                onTap: () {},
              ),

              _drawerItem(
                icon: Icons.logout,
                title: "Log Out",
                onTap: ()async {
                     await pref!.remove("token");
                     await pref!.remove("isLoggedIn");                
                     Get.offAllNamed("/login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? trailing,
    bool isSelected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: isSelected ? Colors.grey.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 16,
            ),
            child: Row(
              children: [
                Icon(icon, size: 22),

                const SizedBox(width: 15),

                Expanded(
                  child: TextComponent(
                    txt: title,
                  ),
                ),

                if (trailing != null)
                  TextComponent(
                    txt: trailing,
                    color: Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildHeader(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: FormfieldComponent(
            controller: controller.searchController,
            hintText: "Search your product",
            prefixIcon: const Icon(Icons.search),
            border: false,
          ),
        ),
      ),

      const SizedBox(width: 10),

      /// CART
      Obx(
        () => Stack(
          children: [
            iconComponent(
              Icons.shopping_bag_outlined,
              grey,
              () {
                Get.toNamed("/cart");
              },
            ),

            if (cartController.cartItems.isNotEmpty)
              buildCartBadge(cartController),
          ],
        ),
      ),

      const SizedBox(width: 10),

      /// DRAWER BUTTON
      Builder(
        builder: (context) {
          return iconComponent(
            Icons.menu,
           grey,
            () {
              Scaffold.of(context).openEndDrawer();
            },
          );
        },
      ),
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