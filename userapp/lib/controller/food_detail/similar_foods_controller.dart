import 'package:flutter/material.dart';
import 'package:userapp/model/similar_food_model.dart';
import 'package:userapp/view/components/food_datails/similar_foods.dart';

final List<SimilarFoodModel> similarFoodList = [
  SimilarFoodModel(
      image: "lib/assets/special/chillyBurger.jpg",
      itemName: "Boss Special Cheese",
      itemprice: 375,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
  SimilarFoodModel(
      image: "lib/assets/special/kitfo.png",
      itemName: "Special Kitfo",
      itemprice: 355,
      itemTag: "Traditional",
      restaurant: "Bete Maed"),
  SimilarFoodModel(
      image: "lib/assets/special/Dulet.png",
      itemName: "Dulet",
      itemprice: 100,
      itemTag: "Meat",
      restaurant: "Bete Maed"),
  SimilarFoodModel(
      image: "lib/assets/special/boss-coca.jpg",
      itemName: "Burger + Free Coke",
      itemprice: 254,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
  SimilarFoodModel(
      image: "lib/assets/special/devine.webp",
      itemName: "Burger + Free Coke",
      itemprice: 189,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
];

Container similarFoodsContainer(context) {
  return similarFoods(context);
}
