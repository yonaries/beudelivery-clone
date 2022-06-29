import 'package:flutter/material.dart';

import '../model/demo_order_model.dart';
import '../view/components/order_history/empty_history.dart';
import '../view/components/order_history/order_history_listbuilder.dart';

class OrdersHistoryController extends ChangeNotifier {
  final List<DemoOrderModel> _ordersList = [];
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  List<DemoOrderModel> get orderList => _ordersList;

  Widget checkOrderHistory({required List ordersList}) {
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
      return const EmptyOrderHistoryPage();
    }
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
    // _isLoaded = false;
    final data = await fetchOrders();
    _ordersList.addAll(data);
    _isLoaded = true;
    notifyListeners();
  }

//demo data fetching
  Future<List<DemoOrderModel>> fetchOrders() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      // DemoOrderModel(
      //   orderId: "7873827428",
      //   orderTime: "12:45 PM",
      //   orderDate: "Jun 23, 2022",
      //   orderStatus: "Delivered",
      //   totalItemsQuantity: "9",
      //   paid: "1080",
      // ),
      // DemoOrderModel(
      //   orderId: "123456789",
      //   orderTime: "2:45 PM",
      //   orderDate: "Apr 12, 2022",
      //   orderStatus: "Cancled",
      //   totalItemsQuantity: "8",
      //   paid: "1080",
      // )
    ];
  }
}
