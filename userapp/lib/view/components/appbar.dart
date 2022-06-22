import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar topAppBar() {
  return AppBar(
    backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(245, 245, 248, 1)),
    elevation: 0,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(19.0),
      child: Image.asset(
        "lib/assets/icons/Vector.png",
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: Image.asset("lib/assets/icons/bell.png"),
      )
    ],
    title: SizedBox(child: Image.asset("lib/assets/images/beudelivery.png")),
  );
}
