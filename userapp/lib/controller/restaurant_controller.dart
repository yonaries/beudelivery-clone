import 'package:flutter/cupertino.dart';
import 'package:userapp/model/demo_restoarant_model.dart';

import '../model/restaurant_menu_model.dart';

class RestaurantsController extends ChangeNotifier {
  final List<RestaurantMenuModel> _menuList = [];
  final List<DemoRestaurant> _restaurantsList = [];
  bool _menuIsLoaded = false;
  bool _restaurantIsLoaded = false;

  List<RestaurantMenuModel> get menuList => _menuList;
  List<DemoRestaurant> get restaurantsList => _restaurantsList;

  bool get menuIsLoaded => _menuIsLoaded;
  bool get restaurantIsLoaded => _restaurantIsLoaded;

  getMenu() async {
    final data = await fetchMenu();

    _menuList.addAll(data);
    _menuIsLoaded = true;
    notifyListeners();
  }

  getRetaurants() async {
    final data = await fetchRestaurants();
    if (_restaurantsList.isEmpty) {
      _restaurantsList.addAll(data);
    }
    _restaurantIsLoaded = true;
    notifyListeners();
  }

  //Fetching Restaurants
  Future<List<DemoRestaurant>> fetchRestaurants() async {
    await Future.delayed(const Duration(seconds: 5));
    return [
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
      DemoRestaurant(
        restaurant: "Angla Burger",
        location: "location",
        description: "description",
        image: "lib/assets/restaurants/284154060368510976.png",
        phone: "+2511181855",
        cover:
            "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
      ),
    ];
  }

  //Fetching Restaurants menu
  Future<List<RestaurantMenuModel>> fetchMenu() async {
    return [
      RestaurantMenuModel(
        image: "lib/assets/special/chillyBurger.jpg",
        itemName: "Boss Special Cheese",
        itemprice: 375,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'large',
      ),
      RestaurantMenuModel(
        image: "lib/assets/special/kitfo.png",
        itemName: "Special Kitfo",
        itemprice: 355,
        itemTag: "Traditional",
        restaurant: "Bete Maed",
        description: "Burger description",
        itemSize: 'large',
      ),
      RestaurantMenuModel(
        image: "lib/assets/special/Dulet.png",
        itemName: "Dulet",
        itemprice: 100,
        itemTag: "Meat",
        restaurant: "Bete Maed",
        description: "Burger description",
        itemSize: 'large',
      ),
      RestaurantMenuModel(
        image: "lib/assets/special/boss-coca.jpg",
        itemName: "Burger + Free Coke",
        itemprice: 254,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
      RestaurantMenuModel(
        image: "lib/assets/special/devine.webp",
        itemName: "Burger + Free Coke",
        itemprice: 189,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
      RestaurantMenuModel(
        image: "lib/assets/special/devine.webp",
        itemName: "Burger + Free Coke",
        itemprice: 189,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
      RestaurantMenuModel(
        image: "lib/assets/special/devine.webp",
        itemName: "Burger + Free Coke",
        itemprice: 189,
        itemTag: "Burger",
        restaurant: "Boss Burger",
        description: "Burger description",
        itemSize: 'small',
      ),
    ];
  }
}
