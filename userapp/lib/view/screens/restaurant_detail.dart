import 'package:flutter/material.dart';
import 'package:userapp/controller/restaurant_menu_controller.dart';
import 'package:userapp/view/components/nav_bottom.dart';
import 'package:userapp/view/components/restaurant_detail/restaurant_image.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  bool isFavorite = false;
  void favoriteBtnHandler() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            restaurantDetailImageComponent(
              logoImage: "lib/assets/restaurants/284154060368510976.png",
              coverImage:
                  "lib/assets/restaurants/AF1QipMfFnyxWtvDvOidD8QGx5dMVndaYd2LrkXr26AW=s1024-k-no.jpg",
              favoriteBtnHandler: favoriteBtnHandler,
              isFavorite: isFavorite,
              context: context,
            ),

            const SizedBox(
              height: 60,
            ),

            // Other Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: currentWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Angla Burger",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //  Restaurant Address

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Bole Road Behind Boston Day Spa",
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "7.5",
                                        style: TextStyle(
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                      TextSpan(text: " Km Away"),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "description description description description description desc description description description description description description description description description description description description description description description",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // Menu
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Menu",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: const [
                              Text("See All",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_circle_right_rounded)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Restaurant menus
                  restaurantMenu(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
