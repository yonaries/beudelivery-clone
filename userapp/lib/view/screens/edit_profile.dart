import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../controller/user_profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final _inputTextController = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    final customer = Provider.of<UserProfileController>(context).customer[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.deepOrange,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 80,
            child: Container(
              padding: const EdgeInsets.all(15),
              width: currentWidth,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 50, bottom: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    inputBox(currentWidth, customer.fullName, "Full Name"),
                    inputBox(currentWidth, customer.userName, "Username"),
                    inputBox(currentWidth, customer.email, "Email"),
                    inputBox(currentWidth, customer.password, "Password"),
                    inputBox(currentWidth, customer.phone, "Phone"),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepOrange),
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                      ),
                      onPressed: () {},
                      child: const Text("Update"),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(fit: BoxFit.cover, customer.image),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding inputBox(double currentWidth, String customer, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(title),
          ),
          const SizedBox(height: 10),
          Container(
            width: currentWidth * 0.5,
            alignment: Alignment.centerLeft,
            child: TextField(
              textAlign: TextAlign.right,
              cursorColor: Colors.red,
              controller: _inputTextController,
              decoration:
                  InputDecoration(hintText: customer, border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
