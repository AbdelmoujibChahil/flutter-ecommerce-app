import 'package:get/get.dart';
import 'package:project/app/models/Products/category.dart';
import 'package:project/app/models/Products/product.dart';
import 'package:project/app/models/Products/type.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  var categories = [
    Cat(id: 1, nom: "Kids"),
    Cat(id: 2, nom: "Man"),
     Cat(id: 1, nom: "Kids"),
    Cat(id: 2, nom: "Man"),
  ];

  var types = [
    TypeProduct(id: 1, nom: "T-shirt", image: "assets/images/home.jpg"),
    TypeProduct(id: 2, nom: "Jean", image: "assets/images/home.jpg"),
     TypeProduct(id: 1, nom: "T-shirt", image: "assets/images/home.jpg"),
    TypeProduct(id: 2, nom: "Jean", image: "assets/images/home.jpg"),
  ];

  var products = [
    Product(id: 1, nom: "T-shirt", prix: 200),
    Product(id: 1, nom: "T-shirt", prix: 200),
    Product(id: 2, nom: "Jacket", prix: 300),
    Product(id: 1, nom: "T-shirt", prix: 200),
    Product(id: 2, nom: "Jacket", prix: 300),
    Product(id: 2, nom: "Jacket", prix: 300),
  ];

  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}