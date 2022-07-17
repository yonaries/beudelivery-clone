import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/coupons_controller.dart';
import 'package:userapp/controller/refresh_conroller.dart';
import 'package:userapp/model/customerModel.dart';
import 'package:userapp/model/demo_offers_model.dart';
import 'package:userapp/view/components/appbar.dart';
import 'package:userapp/view/components/nav_bottom.dart';

import '../components/offers/coupon_tile.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({Key? key}) : super(key: key);

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var offersFuture;

  @override
  void initState() {
    super.initState();
    offersFuture =
        Provider.of<CouponsController>(context, listen: false).addDataToList();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CouponsController>(context);
    final coupons = Provider.of<CouponsController>(context).coupons;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(19.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.deepOrange,
            ),
          ),
        ),
        title: const Text("Offers", style: TextStyle(color: Colors.deepOrange)),
        backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
        centerTitle: true,
        elevation: 1,
        toolbarHeight: 70,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(245, 245, 248, 1),
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: refreshController(
        onRefresh: () => controller.refresh(),
        child: ListView.builder(
          itemCount: coupons.length,
          itemBuilder: (context, index) => CouponTile(
              amount: coupons[index].amount,
              restaurant: coupons[index].restaurant,
              imageURL: coupons[index].imageURL,
              prefix: coupons[index].prefix,
              subfix: coupons[index].subfix,
              expiredOn: coupons[index].expiredOn),
        ),
      ),
    );
  }
}
