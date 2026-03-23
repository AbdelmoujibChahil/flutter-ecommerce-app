import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/Products/category.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/models/Products/type.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
var selectedCategoryId = 1.obs;
  ///  Search
  var searchController = TextEditingController();

  ///  DATA
  var categories = [
    Cat(id: 1, nom: "Kids"),
    Cat(id: 2, nom: "Man"),
  ];

  var types = [
    TypeProduct(id: 1, nom: "T-shirt", image: "assets/images/home.jpg"),
    TypeProduct(id: 2, nom: "Jean", image: "assets/images/home.jpg"),
  ];

var products = <Product>[
  Product(id: 1, nom: "T-shirt", prix: 200, categoryId: 1),
  Product(id: 2, nom: "Jacket", prix: 300, categoryId: 2),
  Product(id: 3, nom: "Shoes", prix: 400, categoryId: 1),
].obs;

  ///  LISTE FILTRÉE
  var filteredProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    /// au début → tous les produits
    filteredProducts.assignAll(products);

    /// écouter la search bar
    searchController.addListener(() {
      filterProducts();
    });
  }

  ///  FILTRAGE
void filterProducts() {
  String query = searchController.text.toLowerCase();

  filteredProducts.assignAll(
    products.where((p) {
      final matchCategory = p.categoryId == selectedCategoryId.value;

      final matchSearch =
          p.nom.toLowerCase().contains(query);

      return matchCategory && matchSearch;
    }),
  );
}

  void selectCategory(int index) {
  selectedIndex.value = index;

  selectedCategoryId.value = categories[index].id;

  filterProducts(); 
}
}