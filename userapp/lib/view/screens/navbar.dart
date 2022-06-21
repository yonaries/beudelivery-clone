import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userapp/view/components/common/bottom_nav_bar.dart';
import 'package:userapp/view/screens/homepage.dart';

//* states
int currentPageIndex = 0;

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void pageChangeHandler(index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // app pages
    const pages = [
      Center(child: Homepage()),
      Center(child: Text("Cart", style: TextStyle(fontSize: 20))),
      Center(child: Text("Orders", style: TextStyle(fontSize: 20))),
      Center(child: Text("Profile", style: TextStyle(fontSize: 20))),
    ];
    return Scaffold(
      body: pages[currentPageIndex],
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      bottomNavigationBar: bottomNavBar(
        pageChangeHandler: pageChangeHandler,
        context: context,
      ),
    );
  }
}
