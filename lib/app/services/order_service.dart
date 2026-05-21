import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:project/app/models/Checkout/order.dart';

class OrderService {

  Future<bool> order(OrderModel order) async {

    final response = await http.post(

      Uri.parse("https://api.example.com/order"),

      headers: {
        "Content-Type": "application/json",
      },

      body: jsonEncode(
        order.toJson(),
      ),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201) {

      final data = jsonDecode(response.body);

      print(data);

      return true;
    }

    return false;
  }
}