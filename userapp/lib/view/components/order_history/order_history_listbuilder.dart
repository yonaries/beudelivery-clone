import 'package:flutter/material.dart';
import 'package:userapp/model/demo_order_model.dart';

import 'order_history_list.dart';

class OrdersHistoryListView extends StatelessWidget {
  final List<DemoOrderModel> orders;
  const OrdersHistoryListView({Key? key, required this.orders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Material(
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: ((context, index) => buildOrderHistory(
              width: currentWidth,
              orderId: orders[index].orderId,
              orderTime: orders[index].orderTime,
              orderDate: orders[index].orderDate,
              orderStatus: orders[index].orderStatus,
              totalItemsQuantity: orders[index].totalItemsQuantity,
              paid: orders[index].paid,
              item: orders[index].item,
            )),
      ),
    );
  }
}
