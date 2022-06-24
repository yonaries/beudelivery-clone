import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/model/bag_item_model.dart';
import 'package:userapp/providers/navbar_provider.dart';
import 'package:userapp/view/components/bag/bag_list_builder.dart';
import 'package:userapp/view/screens/homepage.dart';

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
    itemCount: 1,
  ),
  CartItemsModel(
    image: "lib/assets/special/chillyBurger.jpg",
    itemName: "Boss Special Cheese",
    itemprice: 375.0,
    restaurant: "Boss Burger",
    itemSize: 'small',
    itemCount: 1,
  ),
];

Widget bagItemContainer(
    context, cartItemIncrementDecrementHandler, removeCartItem) {
  double total = 0;
  for (int i = 0; i < cartList.length; i++) {
    total += cartList[i].itemprice * cartList[i].itemCount;
  }
  if (cartList.isNotEmpty) {
    return Stack(
      children: [
        BagItemListBuilder(
            context, cartItemIncrementDecrementHandler, removeCartItem),
        Positioned(
          bottom: 15,
          child: Center(
            widthFactor: 1.3,
            child: startOrderingButton(
                buttonText: "Place Order - $total",
                hasCartItem: true,
                context: context),
          ),
        )
      ],
    );
  }
  return Stack(
    children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/icons/empty_bag_Image.png"),
            Text(
              "No Order Yet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              "Your bag is hungry",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),

      //Start Ordering Button
      Positioned(
        bottom: 15,
        child: Center(
          widthFactor: 1.3,
          child: startOrderingButton(
              buttonText: "Start Ordering",
              hasCartItem: false,
              context: context),
        ),
      )
    ],
  );
}

InkWell startOrderingButton(
    {required String buttonText, required bool hasCartItem, required context}) {
  final currentNavBar = Provider.of<NavBarController>(context);
  return InkWell(
    onTap: () {
      if (hasCartItem) {
        // send to checkout
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return
        // }));
      } else {
        // Send to Home
        currentNavBar.changePage(0);
      }
    },
    child: Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
