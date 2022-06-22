import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:userapp/providers/navbar_provider.dart';
import 'package:userapp/view/components/nav_bottom.dart';
import 'package:userapp/view/screens/homepage.dart';

//* states
class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    //state
    int currentSelected =
        Provider.of<NavBarController>(context).currentPageIndex;
    // app pages
    const pages = [
      Center(child: Homepage()),
      Center(child: Text("Cart", style: TextStyle(fontSize: 20))),
      Center(child: Text("Orders", style: TextStyle(fontSize: 20))),
      Center(child: Text("Profile", style: TextStyle(fontSize: 20))),
    ];
    return Scaffold(
      body: pages[currentSelected],
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
