import 'package:flutter/material.dart';

paymentProviderButtons() {
  return Column(
    children: [
      Row(
        children: [
          // cash on delivery
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Ink(
                child: const Text(
                  "Cash On Door",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          // card
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Text(
                "Card",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          // Apple Pay
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.apple,
                    size: 18,
                  ),
                  Text(
                    "Pay",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          // Google Pay
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "lib/assets/icons/google.png",
                    height: 18,
                  ),
                  const Text(
                    "Pay",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      const SizedBox(
        height: 25,
      ),
      // 2nd row
      Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: 40,
              width: 40,
              child: Image.asset(
                "lib/assets/icons/telebirr.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: 40,
              width: 40,
              child: Image.asset(
                "lib/assets/icons/amole.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: 40,
              width: 40,
              child: Image.asset(
                "lib/assets/icons/hellocash.webp",
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: 40,
              width: 40,
              child: Image.asset(
                "lib/assets/icons/cbe birr.webp",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
