import 'package:flutter/material.dart';

Padding searchBar(double currentWidth) {
  final _searchInputController = TextEditingController();

  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 0.34),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.search),
          SizedBox(
            width: currentWidth / 1.5,
            child: TextField(
              controller: _searchInputController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search for Items, Restaurants",
                hintStyle: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
