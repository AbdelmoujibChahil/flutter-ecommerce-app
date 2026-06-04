
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project/main.dart';

class AuthMiddleware extends GetMiddleware {

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {

    final token = await pref!.getString("token");

    if (token == null || token.isEmpty ) {
      return GetNavConfig.fromRoute("/login");
    }

    return null;
  }
}