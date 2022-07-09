import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer';

import '../../../model/demo_order_model.dart';

Widget buildOrderHistory(
    {required double width,
    required String orderId,
    required String orderTime,
    required String orderDate,
    required String orderStatus,
    required String totalItemsQuantity,
    required String paid,
    required List<Items> item}) {
  // ignore: no_leading_underscores_for_local_identifiers
  String _orderDate = convertOrderDate(orderDate);
  log(item.toString());
  return GestureDetector(
    onTap: () {
      print(item);
      for (var element in item) {
        log(element.itemName.toString());
        log(element.quantity.toString());
      }
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: width,
      height: 200,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#$orderId",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$_orderDate at $orderTime",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                orderStatus,
                style: TextStyle(
                    color: styleOrderStatus(orderStatus),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$totalItemsQuantity Items",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Stack(
                    // width: 200,
                    children: [iterateItems(item: item)],
                  ),
                  // Expanded(child: ListView.builder(itemBuilder: (context, index) => iterateItems(item: item) )),
                  const Text(
                    "and more",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Br ",
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    paid,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Color styleOrderStatus(orderStatus) {
  if (orderStatus == "Delivered") {
    return Colors.green;
  } else if (orderStatus == "On way") {
    return Colors.amber;
  } else {
    return Colors.redAccent;
  }
}

convertOrderDate(orderDate) {
  String currentDate = DateFormat.yMMMd().format(DateTime.now());

  if (currentDate == orderDate) {
    return "Today";
  } else {
    return orderDate;
  }
}

iterateItems({required List<Items> item}) {
  List<Widget> names = [];
  for (int i = 0; i < 2; i++) {
    final name = item[i].itemName;
    final quantity = item[i].quantity;

    names.add(Text(
      "$name x$quantity",
      style: const TextStyle(color: Colors.grey),
    ));
  }

  // if (item.length > 2) {
  //   names.add(
  //     const Text(
  //       "and more",
  //       style: TextStyle(color: Colors.grey),
  //     ),
  //   );
  // }
  // log(names.toString());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: names,
  );
}
