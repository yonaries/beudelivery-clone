import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

showToastMessage({required String message}) {
  Toast.show(
    message,
    duration: Toast.lengthLong,
    gravity: Toast.bottom,
    backgroundColor: Colors.deepOrange,
  );
}
