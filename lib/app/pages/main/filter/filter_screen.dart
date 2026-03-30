import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/main/filterController/filterController.dart';
import 'package:project/app/pages/components/filter_components/filter_component.dart';
import 'package:project/app/pages/components/text_component.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
           icon: const Icon(Icons.arrow_back, color: Colors.black),
           onPressed: () {
           Get.back(); 
  },
),
        title: const Text("Filter", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.resetFilters,
            icon: const Icon(Icons.delete_outline, color: Colors.black),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// BRANDS
              sectionTitle("Brands"),
              Obx(() => Wrap(
                spacing: 10,
                children: controller.brands.map((brand) {
                  final selected =
                      controller.selectedBrandId.value == brand.id;

                  return GestureDetector(
                    onTap: () => controller.selectBrand(brand.id),
                    child: chip(
                      text: brand.name,
                      selected: selected,
                    ),
                  );
                }).toList(),
              )),

              const SizedBox(height: 20),

              ///  GENDER
              sectionTitle("Gender"),
              Obx(() => Wrap(
                spacing: 10,
                children: controller.genders.map((g) {
                  int index = controller.genders.indexOf(g);

                  return GestureDetector(
                    onTap: () => controller.selectGender(index),
                    child: chip(
                      text: g,
                      selected:
                          controller.selectedGenderIndex.value == index,
                    ),
                  );
                }).toList(),
              )),

              const SizedBox(height: 20),

              ///  SIZE
              sectionTitle("Select Size"),
              Obx(() => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: controller.sizes.map((size) {
                  return GestureDetector(
                    onTap: () => controller.selectSize(size),
                    child: chip(
                      text: size,
                      selected:
                          controller.selectedSize.value == size,
                    ),
                  );
                }).toList(),
              )),

              const SizedBox(height: 20),

              ///  PRICE
              sectionTitle("Price"),
              Obx(() => RangeSlider(
                values: RangeValues(
                  controller.minPrice.value,
                  controller.maxPrice.value,
                ),
                min: 0,
                max: 3500,
                divisions: 10,
                onChanged: controller.updatePrice,
              )),

              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${controller.minPrice.value.toInt()} DH"),
                  Text("${controller.maxPrice.value.toInt()} DH"),
                ],
              )),

              const SizedBox(height: 20),

              ///  COLORS (UI only)
              sectionTitle("Select Color"),
              Row(
                children: [
                  colorCircle(Colors.red),
                  colorCircle(Colors.black),
                  colorCircle(Colors.green),
                  colorCircle(Colors.orange),
                ],
              ),

              const SizedBox(height: 30),

              ///  BUTTON APPLY
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final filters = controller.getFilters();

                    ///  envoyer vers HomeController
                    Get.back(result: filters);
                  },
                  child: const TextComponent(txt:"Filter Now",color: Colors.white,fw: FontWeight.bold,family: "Bold",),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}