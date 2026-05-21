class CheckoutModel {

  final String customerName;
  final String city;
  final String district;
  final String postalCode;
  final String phone;

  CheckoutModel({
    required this.customerName,
    required this.city,
    required this.district,
    required this.postalCode,
    required this.phone,
  });

  // Convert object → JSON
  Map<String, dynamic> toJson() {
    return {
      "customer_name": customerName,
      "city": city,
      "district": district,
      "postal_code": postalCode,
      "phone": phone,
    };
  }

  // Convert JSON → object
  factory CheckoutModel.fromJson(Map<String, dynamic> json) {

    return CheckoutModel(
      customerName: json['customer_name'],
      city: json['city'],
      district: json['district'],
      postalCode: json['postal_code'],
      phone: json['phone'],
    );
  }
}