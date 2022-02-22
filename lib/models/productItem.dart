import 'package:flutter/cupertino.dart';

class ProductListModel {
  String name;
  int qty;
  double price;
  double rating;
  String image;
  List<Color> color;

  ProductListModel({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    this.qty = 0,
    this.rating = 0,
  });
}
