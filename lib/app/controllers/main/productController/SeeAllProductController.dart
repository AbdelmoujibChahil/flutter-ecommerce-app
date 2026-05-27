import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/main/productController/ProductController.dart';
import 'package:project/app/models/Products/product.dart';

class SeeAllProductController extends GetxController {

  final ProductController productController =
      Get.find<ProductController>();

  /// SEARCH
  final searchController = TextEditingController();

  /// SORT
  RxString selectedSort = "Newest".obs;

  List<String> sortOptions = [
    "Newest",
    "Price Low",
    "Price High",
    "A-Z",
  ];

  /// SIZE FILTER
  RxString selectedSize = "All".obs;

  List<String> sizeOptions = [
    "All",
    "S",
    "M",
    "L",
    "XL",
  ];

  /// BRAND FILTER
  RxInt selectedBrandId = 0.obs;

  /// PRICE RANGE
  RxDouble minPrice = 0.0.obs;
  RxDouble maxPrice = 5000.0.obs;

  /// FILTERED PRODUCTS
  RxList<Product> filteredProducts =
      <Product>[].obs;

  @override
  void onInit() {

    super.onInit();

    filteredProducts.assignAll(
      productController.products,
    );

    searchController.addListener(
      filterProducts,
    );
  }

  /// FILTER PRODUCTS

  void filterProducts() {

    String query =
        searchController.text.toLowerCase();

    List<Product> products =
        productController.products.where((p) {

      /// SEARCH
      bool matchSearch =
          p.name.toLowerCase().contains(query);

      /// SIZE
      bool matchSize =
          selectedSize.value == "All" ||
          p.sizes.contains(selectedSize.value);

      /// BRAND
      bool matchBrand =
          selectedBrandId.value == 0 ||
          p.brandId == selectedBrandId.value;

      /// PRICE
      bool matchPrice =
          p.price >= minPrice.value &&
          p.price <= maxPrice.value;

      return matchSearch &&
          matchSize &&
          matchBrand &&
          matchPrice;

    }).toList();

    /// SORT
    if (selectedSort.value == "Price Low") {

      products.sort(
        (a, b) => a.price.compareTo(b.price),
      );

    } else if (selectedSort.value == "Price High") {

      products.sort(
        (a, b) => b.price.compareTo(a.price),
      );

    } else if (selectedSort.value == "A-Z") {

      products.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    }

    filteredProducts.assignAll(products);
  }

  /// CHANGE SORT

  void changeSort(String value) {

    selectedSort.value = value;

    filterProducts();
  }

  /// CHANGE SIZE

  void changeSize(String value) {

    selectedSize.value = value;

    filterProducts();
  }

  /// CHANGE BRAND

  void changeBrand(int value) {

    selectedBrandId.value = value;

    filterProducts();
  }

  /// CHANGE PRICE

  void changePrice(
    double min,
    double max,
  ) {

    minPrice.value = min;

    maxPrice.value = max;

    filterProducts();
  }
}