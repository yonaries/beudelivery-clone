import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userapp/view/screens/homepage.dart';
import 'package:userapp/view/screens/navbar.dart';

class NavBarController extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void changePage(page) {
    _currentPageIndex = page;
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const Navbar()));
    log(_currentPageIndex.toString());
    notifyListeners();
  }

  Color selectedPage(page) {
    if (page == currentPageIndex) {
      return Colors.deepOrange;
    } else {
      return const Color.fromRGBO(116, 116, 116, 1);
    }
  }
}
