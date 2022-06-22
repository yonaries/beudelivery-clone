import 'package:flutter/material.dart';
import 'package:userapp/view/screens/navbar.dart';

Container foodDetailImageComponent(
    {required bool isFavorite,
    required Function favoriteBtnHandler,
    context,
    required image}) {
  return Container(
    height: 350,
    color: Colors.black,
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
            image,
            fit: BoxFit.cover,
          ),
        ),

        // Back to home button
        Positioned(
          top: 50,
          left: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const Navbar(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.white,
              ),
            ),
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
