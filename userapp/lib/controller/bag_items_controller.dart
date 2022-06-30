import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/model/bag_item_model.dart';
import 'package:userapp/providers/navbar_provider.dart';
import 'package:userapp/view/components/bag/bag_list_builder.dart';
import 'package:userapp/view/screens/checkout.dart';

List<CartItemsModel> cartList = [];

Widget bagItemContainer(
    context, cartItemIncrementDecrementHandler, removeCartItem) {
  final currentWidth = MediaQuery.of(context).size.width;
  double total = 0;
  for (int i = 0; i < cartList.length; i++) {
    total += cartList[i].itemprice * cartList[i].itemCount;
  }
  if (cartList.isNotEmpty) {
    return Stack(
      children: [
        bagItemListBuilder(
            context, cartItemIncrementDecrementHandler, removeCartItem),
        Positioned(
          bottom: 10,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: currentWidth,
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
            const Text(
              "No Order Yet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const Text(
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
        bottom: 10,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: currentWidth,
          child: startOrderingButton(
              buttonText: "Start Ordering",
              hasCartItem: false,
              context: context),
        ),
      )
    ],
  );
}

GestureDetector startOrderingButton(
    {required String buttonText, required bool hasCartItem, required context}) {
  final currentNavBar = Provider.of<NavBarController>(context);
  return GestureDetector(
    onTap: () {
      if (hasCartItem) {
        // send to checkout
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CheckoutScreen();
            },
          ),
        );
      } else {
        // Send to Home
        currentNavBar.changePage(0);
      }
    },
    child: Center(
      child: Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(30)),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
