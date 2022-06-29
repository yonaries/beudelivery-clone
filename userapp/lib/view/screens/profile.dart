import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:userapp/controller/profile_controller.dart';
import 'package:userapp/view/components/appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      appBar: topAppBar(
        appbarTitle: const Text(
          "Profile",
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: currentHeight * 0.2,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                // color: Colors.white,
                color: const Color.fromRGBO(245, 245, 248, 1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 3),
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "lib/assets/restaurants/maxresdefault.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "John Doe",
                              style: TextStyle(fontSize: 25),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Text(
                                "Edit Profile",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                color: Colors.transparent,
                child: ListView(
                  children: [
                    buildSetting(
                        title: "Payment Methods",
                        icon: Icons.payments_outlined,
                        color: Colors.redAccent),
                    buildSetting(
                        title: "Offers",
                        icon: FontAwesomeIcons.ticketSimple,
                        color: Colors.blueAccent),
                    buildSetting(
                      title: "Promo Codes",
                      icon: FontAwesomeIcons.percent,
                      color: Colors.amber,
                    ),
                    buildSetting(
                      title: "Rewards",
                      icon: FontAwesomeIcons.crown,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSetting(
      {required String title, required IconData icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => ProfileController().goToSetting(title: title),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 2),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const Icon(Icons.arrow_forward_ios, size: 15)
            ],
          ),
        ),
      ),
    );
  }
}
