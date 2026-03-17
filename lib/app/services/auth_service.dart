import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  //LOGIN SERVICE
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
  
    //SIGNUP SERVICE
    Future<bool> signup(String email, String password,String tel) async {

    final response = await http.post(
      Uri.parse("https://api.example.com/signup"), //API Url
      body: {
        "email": email,
        "password": password,
        "tel":tel
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

//Send Email Code
 Future<bool> sendCode(String email) async {

    final response = await http.post(
      Uri.parse("https://api.example.com/verify"), //API Url
      body: {
        "email": email,
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