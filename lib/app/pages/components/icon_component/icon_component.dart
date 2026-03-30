import 'package:flutter/material.dart';
import 'package:project/utils/colors.dart';

Widget iconComponent(IconData icon, Color color,void Function() onpressed) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
    boxShadow: [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 15,
    offset: const Offset(0, 6),
  ),
],
    ),
    child: CircleAvatar(
      radius: 25,
      backgroundColor: color,
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    ),
  );
}