import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userapp/view/screens/notifications.dart';

AppBar topAppBar({required Widget appbarTitle, required context}) {
  return AppBar(
    backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(245, 245, 248, 1),
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(19.0),
      child: Image.asset(
        "lib/assets/icons/Vector.png",
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const NotificationScreen();
            // }));
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const NotificationScreen()),
            );
          },
          child: Image.asset("lib/assets/icons/bell.png"),
        ),
      )
    ],
    title: SizedBox(child: appbarTitle),
  );
}

//secondary AppBar
AppBar secondAppBar(BuildContext context, String title) {
  return AppBar(
    toolbarHeight: 60,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrange,
      statusBarIconBrightness: Brightness.light,
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context, true);
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: Theme.of(context).primaryColor,
        size: 20,
      ),
    ),
    backgroundColor: Colors.deepOrange,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 22,
      ),
    ),
    centerTitle: true,
  );
}
