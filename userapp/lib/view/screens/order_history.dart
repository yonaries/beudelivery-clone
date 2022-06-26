import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
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
      body: const EmptyOrderHistoryPage(),
    );
  }
}
