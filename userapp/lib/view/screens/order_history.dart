import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:userapp/controller/refresh_conroller.dart';

import '../../model/demo_order_model.dart';
import '../components/appbar.dart';
import 'package:userapp/controller/order_page_controller.dart';

import '../components/order_history/empty_history.dart';
import '../components/order_history/order_history_listbuilder.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var orderFuture;

  @override
  void initState() {
    super.initState();
    orderFuture =
        Provider.of<OrdersHistoryController>(context, listen: false).addData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OrdersHistoryController>(context);
    final ordersList = Provider.of<OrdersHistoryController>(context).orderList;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      appBar: topAppBar(
        appbarTitle: const Text(
          "Orders",
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
        context: context,
      ),
      body: refreshController(
        onRefresh: () => controller.refresh(),
        child: FutureBuilder(
          future: orderFuture,
          builder: ((context, snapshot) =>
              controller.checkOrderHistory(ordersList: ordersList)),
        ),
      ),
    );
  }
}
