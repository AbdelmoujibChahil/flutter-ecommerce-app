import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var selectedColor = Rx<Color?>(null);
  var selectedSize = "".obs;
  var currentImageIndex = 0.obs;

  void selectColor(Color color) {
    selectedColor.value = color;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void changeImage(int index) {
    currentImageIndex.value = index;
  }

  void reset() {
    selectedColor.value = null;
    selectedSize.value = "";
    currentImageIndex.value = 0;
  }
}