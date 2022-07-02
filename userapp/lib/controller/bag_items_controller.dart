import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/navbar_provider.dart';
import 'package:userapp/model/bag_item_model.dart';
import 'package:userapp/view/components/bag/bag_list_builder.dart';
import 'package:userapp/view/components/toast.dart';
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
          context,
          cartItemIncrementDecrementHandler,
          removeCartItem,
        ),
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
  return GestureDetector(
    onTap: () {
      // checking if at least one of the item count is greater than 1
      if (hasCartItem && cartList.any((item) => item.itemCount != 0)) {
        // send to checkout
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CheckoutScreen();
            },
          ),
        );
      } else {
        // Send to Home
        showToastMessage(message: "Please Select Food Item");
      }
    },
    child: Center(
      child: Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.deepOrange, Color.fromARGB(255, 255, 166, 64)],
            ),
            borderRadius: BorderRadius.circular(30)),
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
