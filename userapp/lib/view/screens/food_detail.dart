import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userapp/controller/bag_items_controller.dart';
import 'package:userapp/controller/similar_foods_controller.dart';
import 'package:userapp/model/bag_item_model.dart';
import 'package:userapp/model/local_favorites_model.dart';
import 'package:userapp/model/similar_food_model.dart';
import 'package:userapp/model/special_offers_dataModel.dart';
import 'package:userapp/view/components/nav_bottom.dart';
import 'package:userapp/view/components/order_details/order_detail_orders_component.dart';
import 'package:userapp/view/components/food_datails/food_image.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({key}) : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  String image = "";
  String itemName = "";
  double itemprice = 0;
  String itemTag = "";
  String itemSize = "";
  String restaurant = "";
  String description = "";

  int itemCount = 0;
  bool isFavorite = false;
  void plusAndMinusHandler(bool add) {
    if (add) {
      setState(() {
        itemCount++;
      });
    } else if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
    }
  }

  void favoriteBtnHandler() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    // recieving data from another page
    final food = ModalRoute.of(context)!.settings.arguments;
    if (food is SpecialOfferModel) {
      image = food.image;
      itemName = food.itemName;
      itemprice = food.itemprice;
      description = food.description;
      restaurant = food.restaurant;
      itemSize = food.itemSize;
    } else if (food is LocalFavoritesModel) {
      image = food.image;
      itemName = food.itemName;
      itemprice = food.itemprice;
      description = food.description;
      restaurant = food.restaurant;
      itemSize = food.itemSize;
    } else if (food is SimilarFoodModel) {
      image = food.image;
      itemName = food.itemName;
      itemprice = food.itemprice;
      description = food.description;
      restaurant = food.restaurant;
      itemSize = food.itemSize;
    }
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Image and Buttons
                foodDetailImageComponent(
                  isFavorite: isFavorite,
                  favoriteBtnHandler: favoriteBtnHandler,
                  context: context,
                  image: image,
                ),

                const SizedBox(
                  height: 50,
                ),

                //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name and price
                      OrderDetailOrderComponent(
                        foodName: itemName,
                        foodType: itemSize,
                        price: itemprice,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "From : $restaurant",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    plusAndMinusHandler(false);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  child: Text(
                                    "$itemCount",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    plusAndMinusHandler(true);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      // Description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "foodDescription",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      // Render list of similar food component
                      similarFoodsContainer(context)
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Add to bag button
          ///////////
          Positioned(
            bottom: 10,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: currentWidth,
              child: GestureDetector(
                onTap: () {
                  // cart item model
                  CartItemsModel newItem = CartItemsModel(
                    image: image,
                    itemName: itemName,
                    itemprice: itemprice,
                    restaurant: restaurant,
                    itemSize: itemSize,
                    itemCount: 1,
                  );

                  // logic to check if item is on cart or not
                  bool addToCart = true;
                  for (var item in cartList) {
                    {
                      if (item.itemName == newItem.itemName) {
                        addToCart = false;
                      }
                    }
                  }

                  if (addToCart) {
                    cartList.add(newItem);
                  } else {
                    // show toast if the item is already on cart
                  }
                },
                child: Center(
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      "Add To Bag",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
