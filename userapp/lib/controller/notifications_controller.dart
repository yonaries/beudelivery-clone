import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userapp/model/notifications_model.dart';

class NotificationsController extends ChangeNotifier {
  final List<NotificationsModel> _data = [
    NotificationsModel(
        image: "lib/assets/restaurants/maxresdefault.jpg",
        message: "Sorry, your order from Debonaries Pizza is cancled.",
        time: "3 min ago",
        status: "unseen"),
    NotificationsModel(
        image: "lib/assets/restaurants/angla logo.jpg",
        message: "Order accepted, It's in Kitchen.",
        time: "3 min ago",
        status: "unseen"),
    NotificationsModel(
        image: "lib/assets/restaurants/342318168628264960.jpg",
        message: "Your order has been delivered.\nBon Appetit.",
        time: "3 min ago",
        status: "seen"),
    NotificationsModel(
        image: "lib/assets/restaurants/maxresdefault.jpg",
        message: "Sorry, your order from Debonaries Pizza is cancled.",
        time: "3 min ago",
        status: "unseen"),
    NotificationsModel(
        image: "lib/assets/restaurants/angla logo.jpg",
        message: "Order accepted, It's in Kitchen.",
        time: "3 min ago",
        status: "unseen"),
    NotificationsModel(
        image: "lib/assets/restaurants/342318168628264960.jpg",
        message: "Your order has been delivered.\nBon Appetit.",
        time: "3 min ago",
        status: "seen"),
    NotificationsModel(
        image: "lib/assets/restaurants/maxresdefault.jpg",
        message: "Sorry, your order from Debonaries Pizza is cancled.",
        time: "3 min ago",
        status: "unseen"),
    NotificationsModel(
        image: "lib/assets/restaurants/angla logo.jpg",
        message: "Order accepted, It's in Kitchen.",
        time: "3 min ago",
        status: "unseen"),
    NotificationsModel(
        image: "lib/assets/restaurants/342318168628264960.jpg",
        message: "Your order has been delivered.\nBon Appetit.",
        time: "3 min ago",
        status: "seen"),
  ];

  List<NotificationsModel> get data => _data;

  checkNotificationStatus({required status}) {
    if (status == "seen") {
      return Colors.transparent;
    } else {
      return Colors.deepOrangeAccent.withOpacity(0.2);
    }
  }

  clickToSeen({required index}) {
    _data[index].status = "seen";
    log("changed to seen");
    notifyListeners();
  }

  markAsSeen() {
    for (var i = 0; i < _data.length; i++) {
      _data[i].status = "seen";
    }
    notifyListeners();
  }
}
