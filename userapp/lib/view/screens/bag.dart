import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:userapp/view/components/appbar.dart';
import 'package:userapp/controller/bag_items_controller.dart';
import 'package:userapp/view/components/nav_bottom.dart';
import 'package:userapp/view/components/toast.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  int cartItemIncrementDecrementHandler(bool increment, int index) {
    if (increment) {
      setState(() {
        cartList[index].itemCount = cartList[index].itemCount + 1;
      });
    } else if (cartList[index].itemCount > 0) {
      setState(() {
        cartList[index].itemCount = cartList[index].itemCount - 1;
      });
    }
    return cartList[index].itemCount;
  }

  void removeCartItem(int index) {
    setState(() {
      cartList.remove(cartList[index]);
      showToastMessage(message: "Item removed succesfully.");
    });
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: topAppBar(
        appbarTitle: const Text(
          "Bag",
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
        context: context,
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      body: bagItemContainer(
        context,
        cartItemIncrementDecrementHandler,
        removeCartItem,
      ),
    );
  }
}
