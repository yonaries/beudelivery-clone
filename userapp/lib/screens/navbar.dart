import 'package:flutter/material.dart';
import 'package:userapp/screens/homepage.dart';

//* states
int currentPageIndex = 0;

Color selectedPage(page) {
  if (page == currentPageIndex) {
    return Colors.deepOrange;
  } else {
    return const Color.fromRGBO(116, 116, 116, 1);
  }
}

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    // current screen ratio
    final currentWidth = MediaQuery.of(context).size.width;

    // app pages
    const pages = [
      Center(child: Homepage()),
      Center(child: Text("Cart", style: TextStyle(fontSize: 20))),
      Center(child: Text("Orders", style: TextStyle(fontSize: 20))),
      Center(child: Text("Profile", style: TextStyle(fontSize: 20))),
    ];
    return Scaffold(
      body: pages[currentPageIndex],
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 60,
          width: currentWidth,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 3),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SizedBox(
                    width: currentWidth / 4,
                    child: Image.asset(
                      "lib/assets/icons/beuicon.png",
                      color: selectedPage(0),
                    )),
                onPressed: () {
                  setState(() {
                    currentPageIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: SizedBox(
                    width: currentWidth / 4,
                    child: Image.asset(
                      "lib/assets/icons/shopping-cart.png",
                      color: selectedPage(1),
                    )),
                onPressed: () {
                  setState(() {
                    currentPageIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: SizedBox(
                    width: currentWidth / 4,
                    child: Image.asset("lib/assets/icons/file-text.png",
                        color: selectedPage(2))),
                onPressed: () {
                  setState(() {
                    currentPageIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: SizedBox(
                    width: currentWidth / 4,
                    child: Image.asset("lib/assets/icons/user.png",
                        color: selectedPage(3))),
                onPressed: () {
                  setState(() {
                    currentPageIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
