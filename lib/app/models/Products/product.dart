import 'package:flutter/material.dart';

class Product {
  final int id;
  final String nom;
  final String? image;
  final int prix;
  

  Product({required this.id, required this.nom,this.image,required this.prix});
}