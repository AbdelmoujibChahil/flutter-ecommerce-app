import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/main/productController/homeProductController.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/filter_components/filter_component.dart';
import 'package:project/app/pages/components/icon_component/icon_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

class DetailScreen extends StatelessWidget {
   DetailScreen({super.key});
final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: iconComponent(
         Icons.arrow_back,
           Colors.white,
         () => Get.back(),
        ),
        title: const TextComponent(
          txt: "Product Details",
          family: "Bold",
        ),
        centerTitle: true,
        actions: [
          iconComponent(
              Icons.shopping_bag_outlined,
           const Color(0xFFF1E3C8),
            () {},
          ),
        ],
      ),

      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                   product.image,
                   height: 250,
                   width: double.infinity,
                 fit: BoxFit.cover,),
              ),

              h(15),

              /// DOTS (slider)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dot(false),
                  dot(true),
                  dot(true),
                ],
              ),

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
                      iconComponent( Icons.favorite_border,  grey,(){}),
                      const SizedBox(width: 10),
                      iconComponent( Icons.share,  grey,(){}),
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
                align: TextAlign.start,
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
                  const SizedBox(width: 10),
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
      //Line
         line(grey),
              h(20),

              /// SIZE
              const Text("Select Size", style: TextStyle(fontWeight: FontWeight.bold)),
             h(10),
          Obx(() => Wrap(
            spacing: 10,
            children: product.sizes.map((s) {
            final isSelected = controller.selectedSize.value == s;
 
              return ButtonComponent(
              txt: s,
              onPressed: () => controller.selectSize(s),
              width: 0.1,
              padding: 10,
              bgColor: isSelected ? mainColor : white,
              textColor: isSelected ? Colors.white : Colors.black,
            );
          }).toList(),
        )),

              h(20),

              /// COLORS
              const Text("Select Color", style: TextStyle(fontWeight: FontWeight.bold)),
             h(10),
           Row(
        children: product.colors.map((c) {
          return colorCircle(c, controller);
        }).toList(),
      )
            ],
          ),
        ),
      ),
    );
  }
}


Widget dot(bool active) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: active ? 10 : 8,
    height: active ? 10 : 8,
    decoration: BoxDecoration(
      color: active ? Colors.blue : Colors.grey,
      shape: BoxShape.circle,
    ),
  );
}

Widget sizeBox(String text) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey),
    ),
    child: Text(text),
  );
}


Widget line (Color color) 
{
  return   SizedBox(height: 1,
         width: double.infinity,
         child: Container(color: color,) ,);
}

Widget colorCircle(Color color, HomeController controller) {
  return GestureDetector(
    onTap: () => controller.selectColor(color),
    child: Obx(() => Container(
          margin: const EdgeInsets.only(right: 10),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: controller.selectedColor.value == color
                ? Border.all(color: Colors.black, width: 3)
                : null,
          ),
        )),
  );
}
