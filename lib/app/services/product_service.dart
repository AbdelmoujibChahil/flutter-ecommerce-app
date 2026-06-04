import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/app/models/Products/product.dart';

class ProductService {
  Future<List<Product>> getAllProducts(String token) async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/v1/products/"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products: ${response.body}");
    }
  }
 }