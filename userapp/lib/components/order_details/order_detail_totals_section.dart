import 'package:flutter/material.dart';

class OrderDetailTotalSection extends StatelessWidget {
  final double deliveryFee;
  final double itemTotal;
  OrderDetailTotalSection({
    Key? key,
    required this.itemTotal,
    required this.deliveryFee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPaid = deliveryFee + itemTotal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Item Total
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Item Total",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(text: "Br "),
                    TextSpan(
                      text: "$itemTotal",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // Delivery Fee
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(text: "Br "),
                    TextSpan(
                      text: "$deliveryFee",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // Paid
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Paid",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: "Br "),
                    TextSpan(
                      text: "$totalPaid",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
