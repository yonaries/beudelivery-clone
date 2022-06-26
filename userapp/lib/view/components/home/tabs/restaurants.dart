import 'package:flutter/material.dart';
import 'package:userapp/view/components/home/tabs/foods.dart';
import 'package:userapp/view/screens/restaurant_detail.dart';

buildRestaurants(index, currentWidth, context) {
  if (index < specials.length) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        height: 100,
        width: currentWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RestaurantDetailScreen(),
                settings: RouteSettings(
                  arguments: localFavorites[index],
                ),
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(20)),
                  child: Material(
                    child: Ink.image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        specials[index].image,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: currentWidth - 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: currentWidth - 120,
                        child: Column(
                          children: [
                            SizedBox(
                              width: currentWidth - 120,
                              child: const Text(
                                "Angla Burger",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: currentWidth - 120,
                              child: Row(
                                children: [
                                  buildTags(index),
                                  buildTags(index),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.redAccent,
                                  size: 15,
                                ),
                                Text(
                                  "Piassa, Tewodros RA",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: Row(
                              children: const [
                                Text("3.5",
                                    style: TextStyle(
                                      fontSize: 13,
                                    )),
                                Text("Km Away",
                                    style: TextStyle(
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.deepOrange, Colors.amberAccent])),
      child: const Text(
        "Show All",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Container buildTags(index) {
  return Container(
    margin: const EdgeInsets.only(right: 8, top: 5),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 215, 178),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      specials[index].itemTag,
      style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
    ),
  );
}

class Restaurants extends StatelessWidget {
  const Restaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: specials.length + 1,
            itemBuilder: (context, index) =>
                buildRestaurants(index, currentWidth, context),
          ),
        ),
      ],
    );
  }
}
