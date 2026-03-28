
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final int categoryId; 
  final  int brandId;
   final String gender;
   final List<String>? images;
   final String? description;
   final List<String> sizes; 
  final List<Color> colors;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.brandId,
    required this.gender,
    required this.images,
     this.description,
     required this.sizes ,
     required this.colors,
  });
}