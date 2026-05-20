class PaymentModel {

  final String paymentMethod;

  PaymentModel({
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {

    return {
      "payment_method": paymentMethod,
    };
  }

  factory PaymentModel.fromJson(Map<String, dynamic> json) {

    return PaymentModel(
      paymentMethod: json['payment_method'],
    );
  }
}