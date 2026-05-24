
class UserModel {

  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? image;
  final String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
      role : json["role"],
    );
  }

  Map<String, dynamic> toJson() {

    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "image": image,
      "role" : role,
    };
  }
}