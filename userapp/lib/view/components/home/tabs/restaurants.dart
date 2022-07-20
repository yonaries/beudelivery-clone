// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/restaurant_controller.dart';
import 'package:userapp/view/components/home/tabs/restaurant_tile.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({Key? key}) : super(key: key);

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  void initState() {
    Provider.of<RestaurantsController>(context, listen: false).getRetaurants();
    super.initState();
  }

  int listLength = 3;

  void increaseList() {
    setState(() {
      listLength += 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurants =
        Provider.of<RestaurantsController>(context).restaurantsList;
    final isLoaded =
        Provider.of<RestaurantsController>(context).restaurantIsLoaded;

    return isLoaded
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listLength,
                  itemBuilder: (context, index) => BuildRestaurants(
                      image: restaurants[index].image,
                      restaurant: restaurants[index].restaurant,
                      location: restaurants[index].location),
                ),
              ),
              showMore(restaurants.length)
            ],
          )
        : Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
  }

  Widget showMore(data) {
    if (data > listLength) {
      return GestureDetector(
        onTap: () {
          if (data > listLength) {
            increaseList();
          }
          log("clicked $listLength");
        },
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.amberAccent])),
          child: const Text(
            "Show More",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return Center(child: Text(""));
    }
  }
}
