import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({super.key,required this.taille ,required this.chemin});
final double taille;
final String chemin;
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
    borderRadius: BorderRadius.circular(taille),
    child: Image.asset(
      chemin,
    ),
  );
  }
}