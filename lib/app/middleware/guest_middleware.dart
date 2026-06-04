
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project/main.dart';

class GuestMiddleware extends GetMiddleware {

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {

    final token =  pref!.getString("token");

    if (token != null) {
      return GetNavConfig.fromRoute("/home");
    }

    return null;
  }
}