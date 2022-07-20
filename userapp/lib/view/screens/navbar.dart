import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/view/screens/order_history.dart';

import 'package:userapp/controller/navbar_provider.dart';
import 'package:userapp/view/components/nav_bottom.dart';
import 'package:userapp/view/screens/bag.dart';
import 'package:userapp/view/screens/homepage.dart';
import 'package:userapp/view/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      Homepage(),
      BagScreen(),
      OrderPage(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: pages[currentSelected],
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
