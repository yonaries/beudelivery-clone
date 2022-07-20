import 'package:flutter/material.dart';

//components
import 'foods/localfavorites.dart';
import 'foods/specialoffers.dart';

SizedBox foodsContainer(context) {
  return SizedBox(
    child: Column(
      children: [specialOffers(context), const LocalFavorites()],
    ),
  );
}
