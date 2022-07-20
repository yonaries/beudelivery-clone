import 'package:flutter/material.dart';
import 'package:userapp/model/special_offers_dataModel.dart';

class SpecialOffersController extends ChangeNotifier {
  final List<SpecialOfferModel> _foodList = [];
  bool _isLoaded = false;

  List<SpecialOfferModel> get foodList => _foodList;
  bool get isLoaded => _isLoaded;

  getData() async {
    final data = await fetchSimilars();
    _foodList.clear();
    _foodList.addAll(data);
    _isLoaded = true;
    notifyListeners();
  }

  Future<List<SpecialOfferModel>> fetchSimilars() async {
    await Future.delayed(const Duration(seconds: 5));

    return [
      SpecialOfferModel(
          image: "lib/assets/special/chillyBurger.jpg",
          itemName: "Boss Special Cheese",
          itemprice: 375,
          itemTag: "Burger",
          restaurant: "Boss Burger",
          description: "Food Description",
          itemSize: "small"),
      SpecialOfferModel(
          image: "lib/assets/special/kitfo.png",
          itemName: "Special Kitfo",
          itemprice: 355,
          itemTag: "Traditional",
          restaurant: "Bete Maed",
          description: "Food Description",
          itemSize: "small"),
      SpecialOfferModel(
          image: "lib/assets/special/Dulet.png",
          itemName: "Dulet",
          itemprice: 100,
          itemTag: "Meat",
          restaurant: "Bete Maed",
          description: "Food Description",
          itemSize: "small"),
      SpecialOfferModel(
          image: "lib/assets/special/boss-coca.jpg",
          itemName: "Burger + Free Coke",
          itemprice: 254,
          itemTag: "Burger",
          restaurant: "Boss Burger",
          description: "Food Description",
          itemSize: "small"),
      SpecialOfferModel(
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
