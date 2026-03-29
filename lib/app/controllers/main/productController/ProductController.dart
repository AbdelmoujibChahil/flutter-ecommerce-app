import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/Products/brands.dart';
import 'package:project/app/models/Products/category.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/models/Products/type.dart';

class ProductController extends GetxController {

  /// UI
  var selectedIndex = 0.obs;
  var selectedCategoryId = 1.obs;

  /// SEARCH
  var searchController = TextEditingController();

  /// FILTERS
  var selectedBrandId = 0.obs;
  var selectedGenderId = 0.obs;
  var minPrice = 0.0.obs;
  var maxPrice = 3500.0.obs;

  /// DATA
  var brands = <Brands>[
    Brands(id: 1, name: "Nike"),
    Brands(id: 2, name: "Adidas"),
    Brands(id: 3, name: "Bata"),
  ].obs;

  var categories = [
    Cat(id: 1, name: "Kids"),
    Cat(id: 2, name: "Man"),
  ];

  var types = [
    TypeProduct(id: 1, name: "T-shirt", image: "assets/images/home.jpg"),
    TypeProduct(id: 2, name: "Jean", image: "assets/images/home.jpg"),
  ];

  var products = <Product>[
    Product(
      id: 1,
      name: "T-shirt",
      price: 200,
      categoryId: 1,
      brandId: 1,
      gender: "Kids",
      description: "This is a T-shirt with a good price",
      images: [
        "assets/images/home.jpg",
        "assets/images/home.jpg",
      ],
      sizes: ["S", "M", "L"],
      colors: [Colors.black, Colors.red, Colors.blue],
    ),
    Product(
      id: 2,
      name: "Jacket",
      price: 300,
      categoryId: 2,
      brandId: 1,
      gender: "Men",
      images: [
        "assets/images/home.jpg",
        "assets/images/home.jpg",
        "assets/images/home.jpg",
      ],
      sizes: ["S"],
      colors: [Colors.black, Colors.red, Colors.blue],
    ),
    Product(
      id: 3,
      name: "Shoe",
      price: 400,
      categoryId: 2,
      brandId: 2,
      gender: "Men",
      images: [
        "assets/images/home.jpg",
      ],
      sizes: ["S", "M"],
      colors: [Colors.black, const Color.fromARGB(255, 8, 255, 144), Colors.blue],
    ),
  ].obs;

  /// FILTERED
  var filteredProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredProducts.assignAll(products);

    searchController.addListener(filterProducts);
  }

  void filterProducts() {
    String query = searchController.text.toLowerCase();

    filteredProducts.assignAll(
      products.where((p) {
        return p.categoryId == selectedCategoryId.value &&
            p.name.toLowerCase().contains(query);
      }),
    );
  }

  void selectCategory(int index) {
    selectedIndex.value = index;
    selectedCategoryId.value = categories[index].id;
    filterProducts();
  }

  void applyFilters(Map<String, dynamic> filters) {
    final brandId = filters["brandId"];
    final gender = filters["gender"];
    final size = filters["size"];
    final minPrice = filters["minPrice"];
    final maxPrice = filters["maxPrice"];

    filteredProducts.assignAll(
      products.where((p) {
        return (brandId == 0 || p.brandId == brandId) &&
            (p.price >= minPrice && p.price <= maxPrice) &&
            (gender == "All" || p.gender == gender) &&
            (size == "All" || p.sizes.contains(size));
      }),
    );
  }
}