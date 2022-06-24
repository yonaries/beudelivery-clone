import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

InkWell buildOrderHistory(
  double currentWidth,
  String orderId,
  String orderTime,
  String orderDate,
  String orderStatus,
  String totalItemsQuantity,
  String paid,
) {
  String _orderDate = checkOrderDate(orderDate);

  return InkWell(
    onTap: () {},
    child: Ink(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: currentWidth,
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
                    const Text(
                      "Boss Special Cheese x2",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "Square Pizza x2",
                      style: TextStyle(color: Colors.grey),
                    ),
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
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
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

checkOrderDate(orderDate) {
  String currentDate = DateFormat.yMMMd().format(DateTime.now());

  if (currentDate == orderDate) {
    return "Today";
  } else {
    return orderDate;
  }
}