import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:userapp/model/adsModel.dart';

class AdController extends ChangeNotifier {
  final List<Ads> _ads = [];
  bool _isLoaded = false;

  List<Ads> get ads => _ads;
  bool get isLoaded => _isLoaded;

  getData() async {
    final data = await fetchAds();
    if (_ads.isEmpty) {
      _ads.addAll(data);
      _isLoaded = true;
    }
    notifyListeners();
  }

  Future<List<Ads>> fetchAds() async {
    await Future.delayed(const Duration(seconds: 5));

    final snapshot =
        await FirebaseFirestore.instance.collection("Ads").doc().get();
    // log(snapshot.doc().get().toString());
    // Map<String, dynamic> data =
    //     await snapshot.data!.data() as Map<String, dynamic>;

    // log(data.toString());
    // final data = jsonEncode(snapshot);
    log(snapshot.toString());
    // log(data.toString());

    return [
      Ads(adLink: "lib/assets/images/ads.jpg"),
      Ads(adLink: "lib/assets/images/ad.jpg"),
      Ads(adLink: "lib/assets/images/ad2.jpg")
    ];
  }
}
