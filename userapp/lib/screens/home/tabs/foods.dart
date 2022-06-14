import 'package:flutter/material.dart';

SizedBox foodsContainer() {
  return SizedBox(
    height: double.maxFinite,
    child: Column(
      children: [
        SizedBox(
          height: 200,
          child: Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 300,
                  color: Colors.black,
                ),
                Container(
                  width: 300,
                  color: Colors.blue,
                ),
                Container(
                  width: 300,
                  color: Colors.red,
                ),
                Container(
                  width: 300,
                  color: Colors.black,
                ),
                Container(
                  width: 300,
                  color: Colors.blue,
                ),
                Container(
                  width: 300,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              Container(
                height: 50,
                color: Colors.amber,
              ),
              Container(
                height: 50,
                color: Colors.cyanAccent,
              ),
              Container(
                height: 50,
                color: Colors.blue,
              ),
              Container(
                height: 50,
                color: Colors.black,
              ),
              Container(
                height: 50,
                color: Colors.purple,
              ),
              Container(
                height: 50,
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
