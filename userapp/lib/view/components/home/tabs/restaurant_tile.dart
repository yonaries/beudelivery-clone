import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildRestaurants extends StatefulWidget {
  int limit = 5;
  String restaurant;
  String location;
  String image;

  BuildRestaurants(
      {Key? key,
      required this.restaurant,
      required this.image,
      required this.location})
      : super(key: key);

  @override
  State<BuildRestaurants> createState() => _BuildRestaurantsState();
}

class _BuildRestaurantsState extends State<BuildRestaurants> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        height: 100,
        width: currentWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const RestaurantDetailScreen(),
            //     settings: RouteSettings(
            //       arguments: localFavorites[index],
            //     ),
            //   ),
            // );
          },
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(10)),
                  child: Material(
                    child: Ink.image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        widget.image,
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
                              child: Text(
                                widget.restaurant,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //* tags
                            SizedBox(
                              width: currentWidth - 120,
                              child: Row(
                                children: [
                                  buildTags(),
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
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.redAccent,
                                  size: 15,
                                ),
                                Text(
                                  widget.location,
                                  style: const TextStyle(
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
  }
}

Container buildTags() {
  return Container(
    margin: const EdgeInsets.only(right: 8, top: 5),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 215, 178),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Text(
      "Burger",
      style: TextStyle(fontSize: 12, color: Colors.deepOrange),
    ),
  );
}
