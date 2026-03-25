import 'package:flutter/material.dart';
import 'package:project/app/pages/components/text_component.dart';

Widget sectionTitle(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextComponent(txt: text,fw: FontWeight.bold,sizeFont: 16,)
  );
}

Widget chip({
  required String text,
  required bool selected,
})
 {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    decoration: BoxDecoration(
      color: selected ? Colors.indigo : Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: selected ? Colors.indigo : Colors.grey.shade300,
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: selected ? Colors.white : Colors.black,
      ),
    ),
  );
}

Widget colorCircle(Color color) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}