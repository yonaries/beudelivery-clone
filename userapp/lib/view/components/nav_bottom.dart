import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navbar_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentNavBar = Provider.of<NavBarController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 60,
        width: currentWidth,
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SizedBox(
                  width: currentWidth / 4,
                  child: Image.asset(
                    "lib/assets/icons/beuicon.png",
                    color: currentNavBar.selectedPage(0),
                  )),
              onPressed: () {
                currentNavBar.changePage(0);
              },
            ),
            IconButton(
              icon: SizedBox(
                  width: currentWidth / 4,
                  child: Image.asset(
                    "lib/assets/icons/shopping-cart.png",
                    color: currentNavBar.selectedPage(1),
                  )),
              onPressed: () {
                currentNavBar.changePage(1);
              },
            ),
            IconButton(
              icon: SizedBox(
                  width: currentWidth / 4,
                  child: Image.asset("lib/assets/icons/file-text.png",
                      color: currentNavBar.selectedPage(2))),
              onPressed: () {
                currentNavBar.changePage(2);
              },
            ),
            IconButton(
              icon: SizedBox(
                  width: currentWidth / 4,
                  child: Image.asset("lib/assets/icons/user.png",
                      color: currentNavBar.selectedPage(3))),
              onPressed: () {
                currentNavBar.changePage(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
