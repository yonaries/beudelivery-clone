import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/home/tabs/foods/localfavorites.dart';
import '../components/home/tabs/restaurants.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: secondAppBar(context, "Favorites"),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: currentWidth * 0.6,
              height: 40,
              child: TabBar(
                unselectedLabelColor: Colors.deepOrange,
                labelStyle: const TextStyle(fontSize: 17, color: Colors.white),
                indicator: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: const [
                  Tab(text: "Foods"),
                  Tab(text: "Places"),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  LocalFavorites(),
                  Restaurants(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
