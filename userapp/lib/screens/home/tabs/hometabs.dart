import 'package:flutter/material.dart';

Row tabBars() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40,
        width: 200,
        alignment: Alignment.centerLeft,
        child: const TabBar(
          labelPadding: EdgeInsets.only(left: 1),
          labelColor: Colors.deepOrange,
          labelStyle: TextStyle(fontSize: 17),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.deepOrange,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3,
          tabs: [Tab(text: "Foods"), Tab(text: "Restaurant")],
        ),
      ),
    ],
  );
}
