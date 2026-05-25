import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/app/models/user/user.dart';

class UserService {

  final String baseUrl =
      "http://10.0.2.2:8000/api/v1";

  /// GET USER PROFILE
  Future<UserModel?> getProfile(String token) async {

    final response = await http.get(

      Uri.parse("$baseUrl/me"),

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
  required String imagePath,

}) async {

  var request = http.MultipartRequest(

    "POST",

    Uri.parse(
      "http://10.0.2.2:8000/api/v1/users/profile",
    ),
  );

  request.headers.addAll({

    "Authorization": "Bearer $token",
    "Accept": "application/json",

  });

  // METHOD SPOOFING
  request.fields["_method"] = "PUT";

  request.fields["name"] = name;
  request.fields["email"] = email;
  request.fields["phone"] = phone;

  // IMAGE
  if (imagePath.isNotEmpty) {

    request.files.add(

      await http.MultipartFile.fromPath(
        "image",
        imagePath,
      ),
    );
  }

  final response = await request.send();
  print(imagePath);
  if (response.statusCode == 200) {

    return true;
  }

  return false;
}
}