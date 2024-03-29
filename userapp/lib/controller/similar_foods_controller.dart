import 'package:flutter/material.dart';
import 'package:userapp/model/similar_food_model.dart';
import 'package:userapp/view/components/food_datails/similar_foods.dart';

class SimilarFoodsController extends ChangeNotifier {
  final List<SimilarFoodModel> _similarFoodList = [];
  bool _isLoaded = false;

  List<SimilarFoodModel> get similarFoodList => _similarFoodList;
  bool get isLoaded => _isLoaded;

  getData() async {
    final data = await fetchSimilars();
    _similarFoodList.clear();
    _similarFoodList.addAll(data);
    _isLoaded = true;
    notifyListeners();
  }

  Future<List<SimilarFoodModel>> fetchSimilars() async {
    await Future.delayed(const Duration(seconds: 5));

    return [
      SimilarFoodModel(
          image: "lib/assets/special/chillyBurger.jpg",
          itemName: "Boss Special Cheese",
          itemprice: 375,
          itemTag: "Burger",
          restaurant: "Boss Burger",
          description: "Food Description",
          itemSize: "small"),
      SimilarFoodModel(
          image: "lib/assets/special/kitfo.png",
          itemName: "Special Kitfo",
          itemprice: 355,
          itemTag: "Traditional",
          restaurant: "Bete Maed",
          description: "Food Description",
          itemSize: "small"),
      SimilarFoodModel(
          image: "lib/assets/special/Dulet.png",
          itemName: "Dulet",
          itemprice: 100,
          itemTag: "Meat",
          restaurant: "Bete Maed",
          description: "Food Description",
          itemSize: "small"),
      SimilarFoodModel(
          image: "lib/assets/special/boss-coca.jpg",
          itemName: "Burger + Free Coke",
          itemprice: 254,
          itemTag: "Burger",
          restaurant: "Boss Burger",
          description: "Food Description",
          itemSize: "small"),
      SimilarFoodModel(
          image: "lib/assets/special/devine.webp",
          itemName: "Burger + Free Coke",
          itemprice: 189,
          itemTag: "Burger",
          restaurant: "Boss Burger",
          description: "Food Description",
          itemSize: "small"),
    ];
  }
}

Widget similarFoodsContainer(context) {
  return similarFoods(context);
}
