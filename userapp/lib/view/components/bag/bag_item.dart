import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BagItem extends StatefulWidget {
  final int index;
  final String image;
  final String restaurant;
  final double price;
  final String foodName;
  final String foodSize;
  final int itemCount;
  final Function cartItemIncrementDecrementHandler;
  final Function removeCartItem;

  const BagItem({
    Key? key,
    required this.index,
    required this.image,
    required this.restaurant,
    required this.price,
    required this.foodName,
    required this.foodSize,
    required this.itemCount,
    required this.cartItemIncrementDecrementHandler,
    required this.removeCartItem,
  }) : super(key: key);

  @override
  State<BagItem> createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {
  @override
  Widget build(BuildContext context) {
    int itemCount = widget.itemCount;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(204, 196, 196, 0.6),
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Slidable(
        // slidable delete button
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.removeCartItem(widget.index);
              },
              icon: Icons.delete_outline,
              label: "Delete",
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              autoClose: true,
            )
          ],
        ),

        // Food Content
        child: Row(
          children: [
            Container(
              width: 110,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(12)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Right hand side texts
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(12)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                widget.foodName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                "Br ${widget.price}",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.foodSize,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            widget.restaurant,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    itemCount = widget
                                        .cartItemIncrementDecrementHandler(
                                            false, widget.index);
                                  });
                                },
                                child: Container(
                                  color: Colors.amber,
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 28,
                                child: Text(
                                  "$itemCount",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    itemCount = widget
                                        .cartItemIncrementDecrementHandler(
                                      true,
                                      widget.index,
                                    );
                                  });
                                },
                                child: Container(
                                  color: Colors.amber,
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
