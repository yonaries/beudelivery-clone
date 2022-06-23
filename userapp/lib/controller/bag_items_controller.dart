import 'package:flutter/material.dart';
import 'package:userapp/model/bag_item_model.dart';
import 'package:userapp/model/similar_food_model.dart';
import 'package:userapp/view/components/bag/bag_item.dart';
import 'package:userapp/view/components/bag/bag_list_builder.dart';
import 'package:userapp/view/components/food_datails/similar_foods.dart';

List<CartItemsModel> cartList = [
  CartItemsModel(
    image: "lib/assets/special/chillyBurger.jpg",
    itemName: "Boss Special Cheese",
    itemprice: 375.0,
    restaurant: "Boss Burger",
    itemSize: 'small',
    itemCount: 0,
  ),
  CartItemsModel(
    image: "lib/assets/special/chillyBurger.jpg",
    itemName: "Boss Special Cheese",
    itemprice: 375.0,
    restaurant: "Boss Burger",
    itemSize: 'small',
    itemCount: 0,
  ),
  CartItemsModel(
    image: "lib/assets/special/chillyBurger.jpg",
    itemName: "Boss Special Cheese",
    itemprice: 375.0,
    restaurant: "Boss Burger",
    itemSize: 'small',
    itemCount: 0,
  ),
];

Widget bagItemContainer(
    context, cartItemIncrementDecrementHandler, removeCartItem) {
  if (cartList.isNotEmpty) {
    return BagItemListBuilder(
        context, cartItemIncrementDecrementHandler, removeCartItem);
  }
  return Center(child: Image.asset("lib/assets/icons/empty_bag_Image.png"));
}
