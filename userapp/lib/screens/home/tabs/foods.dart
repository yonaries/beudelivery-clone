import 'package:flutter/material.dart';
import 'package:userapp/screens/home/tabs/foods/localfavorites.dart';

final Set<String> localFavorites = {
  "lib/assets/items/burger1.png",
  "lib/assets/items/burger2.png",
  "lib/assets/items/burger3.png",
  "lib/assets/items/burger5.png",
  "lib/assets/items/pizza1.png",
  "lib/assets/items/pizza2.png",
  "lib/assets/items/sambusa.jpg",
};

SizedBox foodsContainer(context) {
  return SizedBox(
    height: double.maxFinite,
    child: Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 300,
                color: Colors.black,
              ),
              Container(
                width: 300,
                color: Colors.blue,
              ),
              Container(
                width: 300,
                color: Colors.red,
              ),
              Container(
                width: 300,
                color: Colors.black,
              ),
              Container(
                width: 300,
                color: Colors.blue,
              ),
              Container(
                width: 300,
                color: Colors.red,
              ),
            ],
          ),
        ),
        const LocalFavorites()
      ],
    ),
  );
}
