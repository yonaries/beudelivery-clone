import 'package:flutter/material.dart';

final Set<String> specials = {
  "lib/assets/special/chillyBurger.jpg",
  "lib/assets/special/kitfo.png",
  "lib/assets/special/boss-coca.jpg",
  "lib/assets/special/Dulet.png",
  "lib/assets/special/devine.webp",
};

Container specialOffers(context) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    height: 260,
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
                        child: InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Material(
                              child: Ink.image(
                                fit: BoxFit.cover,
                                image: AssetImage(specials.elementAt(index)),
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
                          const Text(
                            "Boss Special Cheese",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                child: const Text(
                                  "Burger",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.deepOrange),
                                ),
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "Br",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "245",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
