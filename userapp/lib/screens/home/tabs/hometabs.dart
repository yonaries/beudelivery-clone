import 'package:flutter/material.dart';

Expanded tabBars() {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
    ),
  );
}
