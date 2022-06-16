import 'package:flutter/material.dart';

import 'package:userapp/screens/home/tabs/foods/localfavorites.dart';
import 'foods/specialoffers.dart';

final Set<String> localFavorites = {
  "lib/assets/items/burger1.png",
  "lib/assets/items/burger2.png",
  "lib/assets/items/burger3.png",
  "lib/assets/items/burger5.png",
  "lib/assets/items/pizza1.png",
  "lib/assets/items/pizza2.png",
  "lib/assets/items/sambusa.jpg",
};

final Set<String> specials = {
  "lib/assets/special/chillyBurger.jpg",
  "lib/assets/special/kitfo.png",
  "lib/assets/special/boss-coca.jpg",
  "lib/assets/special/Dulet.png",
  "lib/assets/special/devine.webp",
};

SizedBox foodsContainer(context) {
  return SizedBox(
    height: double.maxFinite,
    child: Column(
      children: [specialOffers(context), const LocalFavorites()],
    ),
  );
}
