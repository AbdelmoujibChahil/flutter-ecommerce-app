

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/pages/components/button_component.dart';
import 'package:project/app/pages/components/space_component.dart';
import 'package:project/app/pages/components/text_component.dart';
import 'package:project/utils/colors.dart';

CategoryBox(String product,String? path){
  return 
   Container(
    margin: EdgeInsets.only(right:20),
     child: Column(
      children: [
        Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(path!),fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: mainColor,width: 2)
    ),

        ),
        h(10),
        TextComponent(txt: product,color: Colors.black,fw: FontWeight.bold,)
     
      ],
       ),
   );
}


Widget productCard(Product product) {
  return Card(
    color: white,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 4,
    child: Container(
      width: 160,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ///  IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: Image.asset(
              "assets/images/home.jpg",
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          ///  NOM
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextComponent(
              txt: product.nom,
              fw: FontWeight.bold,
              sizeFont: 15,
            ),
          ),

          const SizedBox(height: 5),

          ///  PRIX
          TextComponent(
            txt: "${product.prix} DH",
          ),

          const SizedBox(height: 10),

          ///  BOUTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ButtonComponent(
              txt: "Add to Cart",
              bgColor: mainColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}