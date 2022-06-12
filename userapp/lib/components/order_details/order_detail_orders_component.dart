import 'package:flutter/material.dart';

class OrderDetailOrderComponent extends StatelessWidget {
  final String foodName;
  final String foodType;
  final int quantity;
  final double price;
  const OrderDetailOrderComponent({
    Key? key,
    required this.foodName,
    required this.foodType,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // food name and quantity
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(text: "$foodName "),
                    TextSpan(
                      text: "x$quantity",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Price
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(text: "Br "),
                    TextSpan(
                      text: "$price",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          // Food Size
          Text(
            foodType,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
