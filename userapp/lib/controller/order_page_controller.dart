import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/demo_order_model.dart';
import '../view/components/order_history/empty_history.dart';
import '../view/components/order_history/order_history_listbuilder.dart';

class OrdersHistoryController extends ChangeNotifier {
  final List<DemoOrderModel> _ordersList = [];
  final bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  List<DemoOrderModel> get orderList => _ordersList;

  Widget checkOrderHistory({required List ordersList}) {
    if (ordersList.isNotEmpty) {
      return OrdersHistoryListView(
        orders: ordersList,
      );
    } else {
      return const EmptyOrderHistoryPage();
    }
  }

//demo data fetching
  Future<List<DemoOrderModel>> fetchOrders() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
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
  }
}
