import 'package:flutter/material.dart';
import 'package:userapp/model/special_offers_dataModel.dart';

import '../model/local_favorites_model.dart';

class LocalFavoritesController extends ChangeNotifier {
  final List<LocalFavoritesModel> _FoodList = [];
  bool _isLoaded = false;

  List<LocalFavoritesModel> get FoodList => _FoodList;
  bool get isLoaded => _isLoaded;

  getData() async {
    final data = await fetchSimilars();
    _FoodList.clear();
    _FoodList.addAll(data);
    _isLoaded = true;
    notifyListeners();
  }

  Future<List<LocalFavoritesModel>> fetchSimilars() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      LocalFavoritesModel(
        image: "lib/assets/special/chillyBurger.jpg",
        itemName: "Boss Special Cheese",
        itemprice: 375,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'large',
      ),
      LocalFavoritesModel(
        image: "lib/assets/special/kitfo.png",
        itemName: "Special Kitfo",
        itemprice: 355,
        itemTag: "Traditional",
        restaurant: "Bete Maed",
        description: "Burger description",
        itemSize: 'large',
      ),
      LocalFavoritesModel(
        image: "lib/assets/special/Dulet.png",
        itemName: "Dulet",
        itemprice: 100,
        itemTag: "Meat",
        restaurant: "Bete Maed",
        description: "Burger description",
        itemSize: 'large',
      ),
      LocalFavoritesModel(
        image: "lib/assets/special/boss-coca.jpg",
        itemName: "Burger + Free Coke",
        itemprice: 254,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
      LocalFavoritesModel(
        image: "lib/assets/special/devine.webp",
        itemName: "Burger + Free Coke",
        itemprice: 189,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
      LocalFavoritesModel(
        image: "lib/assets/special/devine.webp",
        itemName: "Burger + Free Coke",
        itemprice: 189,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
      LocalFavoritesModel(
        image: "lib/assets/special/devine.webp",
        itemName: "Burger + Free Coke",
        itemprice: 189,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
    ];
  }
}
