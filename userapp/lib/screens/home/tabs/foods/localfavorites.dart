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
    return Container(
      child: Expanded(
        child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: localFavorites.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Material(
                        child: Ink.image(
                          fit: BoxFit.cover,
                          image: AssetImage(localFavorites.elementAt(index)),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text("Boss Special Cheese"),
                Row(
                  children: [
                    Container(
                      color: Colors.amberAccent,
                      child: Text("Burger"),
                    ),
                    Row(
                      children: [
                        Text("Br"),
                        Text("245"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
