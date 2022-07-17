import 'package:flutter/cupertino.dart';
import 'package:userapp/model/restaurant_menu_model.dart';
import 'package:userapp/view/components/restaurant_detail/restaurant_menu.dart';

final List<RestaurantMenuModel> restaurantMenuList = [
  RestaurantMenuModel(
    image: "lib/assets/special/chillyBurger.jpg",
    itemName: "Boss Special Cheese",
    itemprice: 375,
    itemTag: "Burger",
    restaurant: "Boss Burger",
    description: "Burger description",
    itemSize: 'large',
  ),
  RestaurantMenuModel(
    image: "lib/assets/special/kitfo.png",
    itemName: "Special Kitfo",
    itemprice: 355,
    itemTag: "Traditional",
    restaurant: "Bete Maed",
    description: "Burger description",
    itemSize: 'large',
  ),
  RestaurantMenuModel(
    image: "lib/assets/special/Dulet.png",
    itemName: "Dulet",
    itemprice: 100,
    itemTag: "Meat",
    restaurant: "Bete Maed",
    description: "Burger description",
    itemSize: 'large',
  ),
  RestaurantMenuModel(
    image: "lib/assets/special/boss-coca.jpg",
    itemName: "Burger + Free Coke",
    itemprice: 254,
    itemTag: "Burger",
    restaurant: "Boss Burger",
    description: "Burger description",
    itemSize: 'small',
  ),
  RestaurantMenuModel(
    image: "lib/assets/special/devine.webp",
    itemName: "Burger + Free Coke",
    itemprice: 189,
    itemTag: "Burger",
    restaurant: "Boss Burger",
    description: "Burger description",
    itemSize: 'small',
  ),
];

Widget restaurantMenu(context) {
  final currentWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    height: (currentWidth / 2 * 0.85) * 3,
    child: Column(children: [RestaurantMenu()]),
  );
}
