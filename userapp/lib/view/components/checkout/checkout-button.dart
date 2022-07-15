import 'package:flutter/material.dart';

GestureDetector checkoutButton({required String title}) {
  return GestureDetector(
    onTap: () {
      // show success message
    },
    child: Center(
      child: Container(
        width: 350,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
