import 'package:flutter/material.dart';

GestureDetector commonButton({required String title}) {
  return GestureDetector(
    onTap: () {
      // show success message
    },
    child: Center(
      child: Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.deepOrange, Color.fromARGB(255, 255, 166, 64)],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
