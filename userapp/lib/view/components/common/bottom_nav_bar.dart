import 'package:flutter/material.dart';
import 'package:userapp/view/screens/navbar.dart';

Color selectedPage(page) {
  if (page == currentPageIndex) {
    return Colors.deepOrange;
  } else {
    return const Color.fromRGBO(116, 116, 116, 1);
  }
}

Padding bottomNavBar({
  pageChangeHandler,
  required context,
}) {
// current screen ratio
  final currentWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 60,
      width: currentWidth,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(0, 3),
          blurRadius: 5,
          spreadRadius: 1,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: SizedBox(
                width: currentWidth / 4,
                child: Image.asset(
                  "lib/assets/icons/beuicon.png",
                  color: selectedPage(0),
                )),
            onPressed: () {
              pageChangeHandler(0);
            },
          ),
          IconButton(
            icon: SizedBox(
                width: currentWidth / 4,
                child: Image.asset(
                  "lib/assets/icons/shopping-cart.png",
                  color: selectedPage(1),
                )),
            onPressed: () {
              pageChangeHandler(1);
            },
          ),
          IconButton(
            icon: SizedBox(
                width: currentWidth / 4,
                child: Image.asset("lib/assets/icons/file-text.png",
                    color: selectedPage(2))),
            onPressed: () {
              pageChangeHandler(2);
            },
          ),
          IconButton(
            icon: SizedBox(
                width: currentWidth / 4,
                child: Image.asset("lib/assets/icons/user.png",
                    color: selectedPage(3))),
            onPressed: () {
              pageChangeHandler(3);
            },
          ),
        ],
      ),
    ),
  );
}
