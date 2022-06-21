import 'package:flutter/material.dart';
import 'package:userapp/model/local_favorites_model.dart';
import 'package:userapp/model/special_offers_dataModel.dart';

import 'package:userapp/view/screens/home/tabs/foods/localfavorites.dart';
import 'foods/specialoffers.dart';

final List<LocalFavoritesModel> localFavorites = [
  LocalFavoritesModel(
      image: "lib/assets/special/chillyBurger.jpg",
      itemName: "Boss Special Cheese",
      itemprice: 375,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
  LocalFavoritesModel(
      image: "lib/assets/special/kitfo.png",
      itemName: "Special Kitfo",
      itemprice: 355,
      itemTag: "Traditional",
      restaurant: "Bete Maed"),
  LocalFavoritesModel(
      image: "lib/assets/special/Dulet.png",
      itemName: "Dulet",
      itemprice: 100,
      itemTag: "Meat",
      restaurant: "Bete Maed"),
  LocalFavoritesModel(
      image: "lib/assets/special/boss-coca.jpg",
      itemName: "Burger + Free Coke",
      itemprice: 254,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
  LocalFavoritesModel(
      image: "lib/assets/special/devine.webp",
      itemName: "Burger + Free Coke",
      itemprice: 189,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
];

final List<SpecialOfferModel> specials = [
  SpecialOfferModel(
      image: "lib/assets/special/chillyBurger.jpg",
      itemName: "Boss Special Cheese",
      itemprice: 375,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
  SpecialOfferModel(
      image: "lib/assets/special/kitfo.png",
      itemName: "Special Kitfo",
      itemprice: 355,
      itemTag: "Traditional",
      restaurant: "Bete Maed"),
  SpecialOfferModel(
      image: "lib/assets/special/Dulet.png",
      itemName: "Dulet",
      itemprice: 100,
      itemTag: "Meat",
      restaurant: "Bete Maed"),
  SpecialOfferModel(
      image: "lib/assets/special/boss-coca.jpg",
      itemName: "Burger + Free Coke",
      itemprice: 254,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
  SpecialOfferModel(
      image: "lib/assets/special/devine.webp",
      itemName: "Burger + Free Coke",
      itemprice: 189,
      itemTag: "Burger",
      restaurant: "Boss Burger"),
];

SizedBox foodsContainer(context) {
  return SizedBox(
    child: Column(
      children: [specialOffers(context), const LocalFavorites()],
    ),
  );
}
