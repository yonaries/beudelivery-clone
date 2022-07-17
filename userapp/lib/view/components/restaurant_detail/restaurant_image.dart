import 'package:flutter/material.dart';
import 'package:userapp/view/screens/navbar.dart';

Container restaurantDetailImageComponent({
  required bool isFavorite,
  required Function favoriteBtnHandler,
  required context,
  required coverImage,
  required logoImage,
}) {
  final currentWidth = MediaQuery.of(context).size.width;
  return Container(
    width: currentWidth,
    height: 350,
    color: Colors.black,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          width: currentWidth,
          child: Image.asset(
            coverImage,
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
              child: const Icon(
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

        // Restaurant logo
        Positioned(
          left: 20,
          bottom: -50,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                logoImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
