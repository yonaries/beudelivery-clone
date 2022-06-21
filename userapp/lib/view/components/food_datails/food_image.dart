import 'package:flutter/material.dart';

SizedBox foodDetailImageComponent(
    {required bool isFavorite, required Function favoriteBtnHandler}) {
  return SizedBox(
    height: 350,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            "lib/assets/images/food_sample.png",
            fit: BoxFit.cover,
          ),
        ),

        // Favorites button

        Positioned(
          bottom: -30,
          right: 20,
          child: GestureDetector(
            onTap: () {
              favoriteBtnHandler();
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(204, 196, 196, 0.6),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
