import 'package:flutter/material.dart';
import 'package:userapp/view/components/home/ads.dart';
import 'package:userapp/view/components/home/searchbar.dart';
import 'package:userapp/view/components/home/tabs/foods.dart';
import 'package:userapp/view/components/home/hometabs.dart';
import 'package:userapp/view/components/appbar.dart';
import 'package:userapp/view/components/home/tabs/restaurants.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // current screen ratio
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      appBar: topAppBar(
          appbarTitle: Image.asset("lib/assets/images/beudelivery.png"),
          context: context),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    searchBar(currentWidth),
                    adBanner(currentHeight),
                    tabBars(),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              foodsContainer(context),
              const Restaurants(),
            ],
          ),
        ),
      ),
    );
  }
}
