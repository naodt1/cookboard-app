import 'package:flutter/material.dart';

class Recipes{
  late String title;
  late String description;
  late String ingredients;
  late String instructions;
  late DateTime timestamp;
  late String imageUrl;

  Recipes({required this.title,required this.description,required this.ingredients,required this.instructions,required this.timestamp,required this.imageUrl,});
}