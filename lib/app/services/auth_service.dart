import 'package:http/http.dart' as http;
import 'package:project/app/models/user/user.dart';
import 'dart:convert';

import 'package:project/main.dart';

class AuthService {
  //LOGIN SERVICE
  Future<bool> login(String email, String password) async {

    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/v1/login"),
      body: {
        "email": email,
        "password": password
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String token = data["access_token"] ;
     await pref!.setString("token", token);

      // sauvegarder token
      return true;
    }

    return false;
  }
  
    //SIGNUP SERVICE
    Future<bool> signup(String email, String password,String tel) async {

    final response = await http.post(
      Uri.parse("http://localhost:8000/api/v1/register"), //API Url
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


Future<bool> verifyOtp(String otp) async {
  try {
    final response = await http.post(
      Uri.parse("https://api.example.com/verify"),
      body: {
        "otp": otp,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String token = data["token"];

      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<bool> resetPassword(String password,String password_confirmation) async {
  try {
    final response = await http.put(
      Uri.parse("https://api.example.com/passwordChange"),
      body: {
        "password": password,
        "password_confirmation":password_confirmation,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String token = data["token"];

      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
  
}