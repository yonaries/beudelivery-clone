import 'package:flutter/material.dart';

class CouponTile extends StatefulWidget {
  final String restaurant;
  final String imageURL;
  final String prefix;
  final String subfix;
  final String amount;
  final String expiredOn;

  const CouponTile({
    Key? key,
    required this.amount,
    required this.restaurant,
    required this.imageURL,
    required this.prefix,
    required this.subfix,
    required this.expiredOn,
  }) : super(key: key);

  @override
  State<CouponTile> createState() => _CouponTileState();
}

class _CouponTileState extends State<CouponTile> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 150,
        child: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 1),
                        spreadRadius: 2,
                        blurRadius: 1)
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: currentWidth * 0.35,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                        child: Image.asset(
                          widget.imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restaurant,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 117, 117, 117)),
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 45,
                                  child: Text(
                                    widget.prefix,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.amount,
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  widget.subfix,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Valid Until ${widget.expiredOn}",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 248, 1),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(-4, 0),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
