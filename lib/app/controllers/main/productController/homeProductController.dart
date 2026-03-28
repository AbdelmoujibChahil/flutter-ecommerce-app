import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/Products/brands.dart';
import 'package:project/app/models/Products/category.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/models/Products/type.dart';

class HomeController extends GetxController {

var currentImageIndex = 0.obs;
var selectedIndex = 0.obs;
var selectedCategoryId = 1.obs;
var selectedColor = Colors.black.obs;
var selectedBrandId = 0.obs; // 0 = All
var selectedGenderId = 0.obs;
var selectedSize = "".obs;
var minPrice = 0.0.obs;
var maxPrice = 3500.0.obs;
 
 
  ///  Search
  var searchController = TextEditingController();

  ///  DATA
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
            gender: "Men",
            description: "This is a T-shirt with a good priec",
            images: [
              "assets/images/home.jpg",
              "assets/images/home.jpg",
              "assets/images/home.jpg",
            ],              sizes: ["S", "M", "L"],
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
            sizes: ["S", "M", "L"],
            
            colors: [Colors.black, Colors.red, Colors.blue],
          ),

          Product(
            id: 3,
            name: "Shoes", 
            price: 400, 
            categoryId: 1,
            brandId: 1,
            gender: "Men",
            images: [
              "assets/images/home.jpg",
            ],          
            sizes: ["S", "M"],
            colors: [Colors.black, const Color.fromARGB(255, 13, 157, 229), const Color.fromARGB(255, 71, 192, 6)],
          )
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
          p.name.toLowerCase().contains(query);

      return matchCategory && matchSearch;
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
      final matchBrand =
          brandId == 0 || p.brandId == brandId;

      final matchPrice =
          p.price >= minPrice && p.price <= maxPrice;

      final matchGender =
          gender == "All" || p.gender == gender;

      final matchSize =
          size == "All" ||  p.sizes.contains(size);

      return matchBrand &&
             matchPrice &&
             matchGender &&
             matchSize;
    }),
  );
}


void selectColor(Color color) {
  selectedColor.value = color;
}

 void selectSize(String size) {
    selectedSize.value = size;
  }

void changeImage(int index) {
  currentImageIndex.value = index;
}

Map<String, dynamic> prepareOrder(Product product) {
  return {
    "product_id": product.id,
    "size": selectedSize.value,
    "color": "#${selectedColor.value.value.toRadixString(16).substring(2)}",
    "quantity": 1,
  };
}
//reset
void resetDetailState() {
  selectedSize.value = "";
  selectedColor.value = Colors.black;
  currentImageIndex.value = 0;
}

}