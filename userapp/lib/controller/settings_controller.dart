import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userapp/view/screens/favorites.dart';
import 'package:userapp/view/screens/offers.dart';

class SettingsController {
  //goto clicked settings
  goToSetting({required title, required context}) {
    if (title == "Payment Methods") {
      // ignore: todo
      //TODO send to payment method screen
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return
      // }));
      log(title);
    } else if (title == "Coupons") {
      // ignore: todo
      //TODO send to offers screen
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const CouponsScreen()),
      );
      log(title);
    }
    if (title == "Favorites") {
      // ignore: todo
      //TODO send to Promo Codes
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const FavoritesScreen()),
      );
      log(title);
    }
    if (title == "Rewards") {
      // ignore: todo
      //TODO send to rewards
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return
      // }));
      log(title);
    }
  }
}
