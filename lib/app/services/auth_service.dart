import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {

  Future<bool> login(String email, String password) async {

    final response = await http.post(
      Uri.parse("https://api.example.com/login"),
      body: {
        "email": email,
        "password": password
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String token = data["token"];

      // sauvegarder token
      return true;
    }

    return false;
  }
}