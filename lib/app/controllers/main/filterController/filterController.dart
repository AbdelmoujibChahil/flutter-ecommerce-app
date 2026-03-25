import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/Products/brands.dart';

class FilterController extends GetxController {

  ///  DATA (injectable plus tard depuis API)
  var brands = <Brands>[
    Brands(id: 0, nom: "All"),
    Brands(id: 1, nom: "Nike"),
    Brands(id: 2, nom: "Adidas"),
    Brands(id: 3, nom: "Bata"),
  ].obs;

  var genders = ["All", "Men", "Kids"].obs;
  var sizes = ["All", "5In", "10In", "24.5In", "41In", "39/40In"].obs;

  ///  STATE
  var selectedBrandId = 0.obs;
  var selectedGenderIndex = 0.obs;
  var selectedSize = "All".obs;

  var minPrice = 0.0.obs;
  var maxPrice = 3500.0.obs;

  ///  ACTIONS

  void selectBrand(int id) {
    selectedBrandId.value = id;
  }

  void selectGender(int index) {
    selectedGenderIndex.value = index;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void updatePrice(RangeValues values) {
    minPrice.value = values.start;
    maxPrice.value = values.end;
  }

  void resetFilters() {
    selectedBrandId.value = 0;
    selectedGenderIndex.value = 0;
    selectedSize.value = "All";
    minPrice.value = 0;
    maxPrice.value = 3500;
  }

  ///  RESULT (tu peux envoyer ça à HomeController)
  Map<String, dynamic> getFilters() {
    return {
      "brandId": selectedBrandId.value,
      "gender": genders[selectedGenderIndex.value],
      "size": selectedSize.value,
      "minPrice": minPrice.value,
      "maxPrice": maxPrice.value,
    };
  }
}