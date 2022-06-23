import 'package:flutter/material.dart';
import 'package:userapp/controller/similar_foods_controller.dart';
import 'package:userapp/view/screens/food_detail.dart';

Container similarFoods(context) {
  return Container(
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            itemCount: similarFoodList.length,
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
                                      arguments: similarFoodList[index],
                                    ),
                                  ),
                                );
                              },
                              child: Ink.image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    similarFoodList[index].image.toString()),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            similarFoodList[index].itemName.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 1),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 215, 178),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  similarFoodList[index].itemTag,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.deepOrange),
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
                                    similarFoodList[index].itemprice.toString(),
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
  );
}
