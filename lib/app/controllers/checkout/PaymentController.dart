import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/models/Checkout/payment.dart';

class PaymentController extends GetxController {

  final selectedPayment = 'Mobile Banking'.obs;

  final paymentMethods = [

    {
      'title': 'Bank Transfers',
      'icon': Icons.account_balance,
    },

    {
      'title': 'Mobile Banking',
      'icon': Icons.phone_android,
    },

    {
      'title': 'Cards',
      'icon': Icons.credit_card,
    },

    {
      'title': 'Payoneer',
      'icon': Icons.payment,
    },

    {
      'title': 'Amazon Hub Counter',
      'icon': Icons.local_shipping,
    },

    {
      'title': 'Apple Pay',
      'icon': Icons.apple,
    },

    {
      'title': 'Google Pay',
      'icon': Icons.g_mobiledata,
    },
  ];

  // Convert selected payment → model
  PaymentModel getPaymentData() {

    return PaymentModel(
      paymentMethod: selectedPayment.value,
    );
  }
}