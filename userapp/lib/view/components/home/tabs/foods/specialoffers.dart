import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/specialOffers_controller.dart';
import 'package:userapp/view/screens/food_detail.dart';

import '../foods.dart';

Widget specialOffers(context) {
  final specials = Provider.of<SpecialOffersController>(context).foodList;
  final isLoaded = Provider.of<SpecialOffersController>(context).isLoaded;

  return isLoaded
      ? Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          height: 265,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Special Offers",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Text("See All",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Icon(Icons.arrow_circle_right_rounded)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specials.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 270,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 260,
                              height: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const FoodDetailScreen(),
                                          settings: RouteSettings(
                                            arguments: specials[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Ink.image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          specials[index].image.toString()),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  specials[index].itemName.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 1),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 215, 178),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        specials[index].itemTag,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Br",
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          specials[index].itemprice.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      : const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        );
}
