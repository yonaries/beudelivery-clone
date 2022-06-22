import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/food_detail/similar_foods_controller.dart';
import 'package:userapp/providers/navbar_provider.dart';
import 'package:userapp/view/components/nav_bottom.dart';
import 'package:userapp/view/components/order_details/order_detail_orders_component.dart';
import 'package:userapp/view/components/food_datails/food_image.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int itemCount = 0;
  bool isFavorite = false;
  void plusAndMinusHandler(bool add) {
    if (add) {
      setState(() {
        itemCount++;
      });
    } else if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
    }
  }

  void favoriteBtnHandler() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    //state
    int currentSelected =
        Provider.of<NavBarController>(context).currentPageIndex;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image and Buttons
            foodDetailImageComponent(
              isFavorite: isFavorite,
              favoriteBtnHandler: favoriteBtnHandler,
            ),

            const SizedBox(
              height: 50,
            ),

            Text("$currentSelected"),

            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name and price
                  const OrderDetailOrderComponent(
                    foodName: "Chilly Cheese Burger",
                    foodType: "Boss Size",
                    quantity: 4,
                    price: 700,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From : Boss Burger",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                plusAndMinusHandler(false);
                              },
                              child: Icon(
                                Icons.remove,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              child: Text(
                                "$itemCount",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                plusAndMinusHandler(true);
                              },
                              child: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // Render list of similar food component
                  similarFoodsContainer(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
