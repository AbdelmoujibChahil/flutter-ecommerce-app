import 'package:project/app/models/Checkout/checkout.dart';
import 'package:project/app/models/Checkout/payment.dart';

class OrderModel {

  final CheckoutModel checkout;
  final PaymentModel payment;
  final double total;

  OrderModel({
    required this.checkout,
    required this.payment,
    required this.total,
  });

  Map<String, dynamic> toJson() {

    return {
      "checkout": checkout.toJson(),
      "payment": payment.toJson(),
      "total": total,
    };
  }
}