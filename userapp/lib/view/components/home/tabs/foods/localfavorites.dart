import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../foods.dart';

class LocalFavorites extends StatefulWidget {
  const LocalFavorites({Key? key}) : super(key: key);

  @override
  State<LocalFavorites> createState() => _LocalFavoritesState();
}

class _LocalFavoritesState extends State<LocalFavorites> {
  @override
  Widget build(BuildContext context) {
    // current screen ratio
    final currentWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: localFavorites.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: currentWidth / 2 * 0.85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        fit: BoxFit.cover,
                        image: AssetImage(localFavorites[index].image),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                localFavorites[index].itemName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 215, 178),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      localFavorites[index].itemTag,
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
                        localFavorites[index].itemprice.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
