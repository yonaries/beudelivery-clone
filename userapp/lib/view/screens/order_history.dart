import 'package:flutter/material.dart';
import 'package:userapp/view/components/appbar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(const Text(
        "Orders",
        style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
      )),
      body: Container(),
    );
  }
}
