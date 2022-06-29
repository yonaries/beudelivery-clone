import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/refresh_conroller.dart';

import '../../../controller/navbar_provider.dart';
import '../../../controller/order_page_controller.dart';

class EmptyOrderHistoryPage extends StatefulWidget {
  const EmptyOrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<EmptyOrderHistoryPage> createState() => _EmptyOrderHistoryPageState();
}

class _EmptyOrderHistoryPageState extends State<EmptyOrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentNavBar = Provider.of<NavBarController>(context);
    final controller = Provider.of<OrdersHistoryController>(context);

    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/images/statement.png"),
              const Text(
                "No Order History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const Text(
                "Hit the orange button below\nto order your favorite meal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        //Start Ordering Button
        Positioned(
          bottom: 10,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: currentWidth,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  currentNavBar.changePage(0);
                  log("clicked");
                },
                child: Container(
                  width: 300,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.deepOrange,
                        Color.fromARGB(255, 255, 166, 64)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Start Ordering",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
