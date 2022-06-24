import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../../model/demo_order_model.dart';
import '../components/order_history/order_history_list.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

final List<DemoOrderModel> _orders = [
  DemoOrderModel(
    orderId: "7873827428",
    orderTime: "12:45 PM",
    orderDate: "Jun 23, 2022",
    orderStatus: "Delivered",
    totalItemsQuantity: "9",
    paid: "1080",
  ),
  DemoOrderModel(
    orderId: "123456789",
    orderTime: "2:45 PM",
    orderDate: "Apr 12, 2022",
    orderStatus: "Cancled",
    totalItemsQuantity: "8",
    paid: "1080",
  )
];

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    //current screen ratio
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      appBar: topAppBar(
        const Text(
          "Orders",
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
      ),
      body: Material(
        child: ListView.builder(
          itemCount: _orders.length,
          itemBuilder: ((context, index) => buildOrderHistory(
                currentWidth,
                _orders[index].orderId,
                _orders[index].orderTime,
                _orders[index].orderDate,
                _orders[index].orderStatus,
                _orders[index].totalItemsQuantity,
                _orders[index].paid,
              )),
        ),
      ),
    );
  }
}
