import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userapp/screens/home/ads.dart';
import 'package:userapp/screens/home/searchbar.dart';
import 'package:userapp/screens/home/tabs/hometabs.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // current screen ratio
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
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
        title:
            SizedBox(child: Image.asset("lib/assets/images/beudelivery.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchBar(currentWidth),
            adBanner(currentHeight),
            //HomeTabViews(currentWidth: currentWidth),
          ],
        ),
      ),
    );
  }
}
