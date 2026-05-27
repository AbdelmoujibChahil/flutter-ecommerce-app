import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';
import 'package:project/app/controllers/main/productController/DetailController.dart';
import 'package:project/app/controllers/main/productController/SeeAllProductController.dart';
import 'package:project/app/pages/components/Products_components.dart';
import 'package:project/app/pages/components/appBar_component/appBar_component.dart';
import 'package:project/utils/colors.dart';

class SeeAllProductScreen extends StatelessWidget {

  SeeAllProductScreen({super.key});

  final cartController = Get.find<CartController>();
  final controller =Get.put(SeeAllProductController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: buildAppBar(null, cartController, "All Products"),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child:
        SingleChildScrollView(child: 
         Column(
          children: [

            /// SEARCH
            TextField(

              controller:
                  controller.searchController,

              decoration: InputDecoration(

                hintText: "Search product...",

                prefixIcon:
                    const Icon(Icons.search),

                filled: true,

                fillColor: Colors.grey.shade100,

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(14),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// FILTERS
            Row(
              children: [

                /// SORT
                Expanded(
                  child: Obx(() =>
                    DropdownButtonFormField(

                      value:
                          controller.selectedSort.value,

                      decoration: InputDecoration(

                        filled: true,

                        fillColor:
                            Colors.grey.shade100,

                        border: OutlineInputBorder(

                          borderRadius:
                              BorderRadius.circular(14),

                          borderSide: BorderSide.none,
                        ),
                      ),

                      items:
                          controller.sortOptions.map((e) {

                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );

                      }).toList(),

                      onChanged: (value) {

                        controller.changeSort(
                          value!,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                /// SIZE
                Expanded(
                  child: Obx(() =>
                    DropdownButtonFormField(

                      value:
                          controller.selectedSize.value,

                      decoration: InputDecoration(

                        filled: true,

                        fillColor:
                            Colors.grey.shade100,

                        border: OutlineInputBorder(

                          borderRadius:
                              BorderRadius.circular(14),

                          borderSide: BorderSide.none,
                        ),
                      ),

                      items:
                          controller.sizeOptions.map((e) {

                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );

                      }).toList(),

                      onChanged: (value) {

                        controller.changeSize(
                          value!,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// PRICE RANGE
            Obx(() => Column(
              children: [

                Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      "Price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "\$${controller.maxPrice.value.toInt()}",
                    ),
                  ],
                ),

                RangeSlider(

                  min: 0,
                  max: 5000,

                  values: RangeValues(
                    controller.minPrice.value,
                    controller.maxPrice.value,
                  ),

                  activeColor: mainColor,

                  onChanged: (value) {

                    controller.changePrice(
                      value.start,
                      value.end,
                    );
                  },
                ),
              ],
            )),

            const SizedBox(height: 10),

            /// PRODUCTS
         Obx(() => Wrap(
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
                ))
    
            ],
        ),
      ),
    ));
  }
}