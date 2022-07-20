import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/ad_controller.dart';
import 'package:userapp/controller/restaurant_controller.dart';
import 'package:userapp/controller/specialOffers_controller.dart';
import 'package:userapp/view/components/home/ads.dart';
import 'package:userapp/view/components/home/searchbar.dart';
import 'package:userapp/view/components/home/tabs/foods.dart';
import 'package:userapp/view/components/home/hometabs.dart';
import 'package:userapp/view/components/appbar.dart';
import 'package:userapp/view/components/home/tabs/restaurants.dart';

import '../../controller/localFavorites_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  void initState() {
    Provider.of<AdController>(context, listen: false).getData();
    Provider.of<SpecialOffersController>(context, listen: false).getData();
    Provider.of<LocalFavoritesController>(context, listen: false).getData();
    Provider.of<RestaurantsController>(context, listen: false).getMenu();
    super.initState();
  }

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
                    adBanner(currentHeight, context),
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
