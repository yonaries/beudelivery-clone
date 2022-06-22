import 'package:flutter/material.dart';
import 'package:userapp/view/components/home/tabs/foods.dart';

buildRestaurants(index, currentWidth) {
  if (index < specials.length) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
          onTap: () {},
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
                width: currentWidth - 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(child: Text("Angla Burger")),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 215, 178),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        specials[index].itemTag,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.deepOrange),
                      ),
                    ),
                    Row(
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
                              Text("Piassa, Tewodros RA"),
                            ],
                          ),
                        ),
                      ],
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
        width: currentWidth * 0.1,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.amberAccent])),
        child: const Text("Show All"));
  }
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
                buildRestaurants(index, currentWidth),
          ),
        ),
      ],
    );
  }
}
