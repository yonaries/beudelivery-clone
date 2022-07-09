import 'package:flutter/material.dart';
import 'package:userapp/controller/refresh_conroller.dart';

import '../model/demo_order_model.dart';
import '../view/components/order_history/empty_history.dart';
import '../view/components/order_history/order_history_listbuilder.dart';

class OrdersHistoryController extends ChangeNotifier {
  final List<DemoOrderModel> _ordersList = [];
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  List<DemoOrderModel> get orderList => _ordersList;

  Widget checkOrderHistory({required List<DemoOrderModel> ordersList}) {
    if (ordersList.isNotEmpty && _isLoaded == true) {
      return OrdersHistoryListView(
        orders: ordersList,
      );
    }
    if (_isLoaded == false) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.deepOrange,
        ),
      );
    } else {
      return refreshController(
        onRefresh: () => refresh(),
        child: const EmptyOrderHistoryPage(),
      );
    }
  }

  toFalse() {
    _isLoaded = false;
    refresh();
    notifyListeners();
  }

  Future<void> addData() async {
    final data = await fetchOrders();
    if (_ordersList.isEmpty) {
      _ordersList.addAll(data);
    }
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> refresh() async {
    _ordersList.clear();

    final data = await fetchOrders();
    _ordersList.addAll(data);
    _isLoaded = true;
    notifyListeners();
  }

//demo data fetching
  Future<List<DemoOrderModel>> fetchOrders() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      DemoOrderModel(
          orderId: "7873827428",
          orderTime: "12:45 PM",
          orderDate: "Jun 29, 2022",
          orderStatus: "On way",
          totalItemsQuantity: "9",
          paid: "1080",
          item: [
            Items(itemName: "Boss Special Cheese", quantity: "2"),
            Items(itemName: "Square Pizza", quantity: "2"),
          ]),
      DemoOrderModel(
          orderId: "123456789",
          orderTime: "2:45 PM",
          orderDate: "Apr 12, 2022",
          orderStatus: "Delivered",
          totalItemsQuantity: "1",
          paid: "180",
          item: [
            Items(itemName: "Special Kitfo", quantity: "1"),
          ])
    ];
  }
}
