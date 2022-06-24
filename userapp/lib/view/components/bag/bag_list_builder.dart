import 'package:flutter/material.dart';
import 'package:userapp/controller/bag_items_controller.dart';
import 'package:userapp/view/components/bag/bag_item.dart';

SizedBox bagItemListBuilder(
    context, cartItemIncrementDecrementHandler, removeCartItem) {
  return SizedBox(
    child: ListView.builder(
      itemCount: cartList.length,
      itemBuilder: (BuildContext context, int index) {
        return BagItem(
            index: index,
            image: cartList[index].image,
            restaurant: cartList[index].restaurant,
            price: cartList[index].itemprice,
            foodName: cartList[index].itemName,
            foodSize: cartList[index].itemSize,
            itemCount: cartList[index].itemCount,
            cartItemIncrementDecrementHandler:
                cartItemIncrementDecrementHandler,
            removeCartItem: removeCartItem);
      },
    ),
  );
}
