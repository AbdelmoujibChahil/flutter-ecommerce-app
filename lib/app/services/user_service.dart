/// ================= USER SERVICE =================

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/app/models/user/user.dart';

class UserService {

  final String baseUrl =
      "http://10.0.2.2:3000/api";

  /// GET USER PROFILE
  Future<UserModel?> getProfile(String token) async {

    final response = await http.get(

      Uri.parse("$baseUrl/user/profile"),

      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return UserModel.fromJson(data);
    }

    return null;
  }

  /// UPDATE PROFILE
  Future<bool> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
  }) async {

    final response = await http.put(

      Uri.parse("$baseUrl/user/profile"),

      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },

      body: jsonEncode({

        "name": name,
        "email": email,
        "phone": phone,
      }),
    );

    return response.statusCode == 200;
  }
}