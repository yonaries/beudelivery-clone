import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/settings_controller.dart';
import 'package:userapp/controller/user_profile_controller.dart';
import 'package:userapp/view/components/appbar.dart';
import 'package:userapp/view/screens/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<UserProfileController>(context, listen: false).getCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customer = Provider.of<UserProfileController>(context).customer;
    final controller = Provider.of<UserProfileController>(context);

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
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: currentHeight * 0.2,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  color: Color.fromRGBO(245, 245, 248, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: controller.isLoaded
                    ? Row(
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
                                    customer[0].image,
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
                                    Text(
                                      customer[0].fullName,
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditProfile())),
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrangeAccent,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Text(
                                          "Edit Profile",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
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
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: double.maxFinite,
              color: Colors.white,
              child: ListView(
                children: [
                  buildSetting(
                    title: "Favorites",
                    icon: FontAwesomeIcons.solidHeart,
                    color: Colors.deepOrange,
                  ),
                  buildSetting(
                      title: "Coupons",
                      icon: FontAwesomeIcons.ticket,
                      color: Colors.black),
                  buildSetting(
                      title: "Payment Methods",
                      icon: Icons.payments_outlined,
                      color: Colors.redAccent),
                  const SizedBox(
                    height: 20,
                  ),
                  buildSetting(
                    title: "Settings",
                    icon: Icons.settings,
                    color: Colors.green,
                  ),
                  buildSetting(
                    title: "Terms and Conditions",
                    icon: Icons.policy,
                    color: Colors.red,
                  ),
                  buildSetting(
                    title: "About",
                    icon: Icons.info,
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSetting(
      {required String title, required IconData icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () =>
            SettingsController().goToSetting(title: title, context: context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
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
                      size: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
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
