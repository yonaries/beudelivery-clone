import 'package:flutter/cupertino.dart';
import 'package:userapp/model/demo_offers_model.dart';

class CouponsController extends ChangeNotifier {
  final List<DemoOffersModel> _couponsList = [];
  bool _isLoaded = false;
  // late DemoOfferDetailsModel _couponDetail;

  List<DemoOffersModel> get coupons => _couponsList;
  bool get isLoaded => _isLoaded;

  Future<void> addDataToList() async {
    final data = await fetchOffers();
    if (_couponsList.isEmpty) {
      _couponsList.addAll(data);
    }
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> refresh() async {
    _couponsList.clear();

    final data = await fetchOffers();
    _couponsList.addAll(data);
    _isLoaded = true;
    notifyListeners();
  }

  Future<List<DemoOffersModel>> fetchOffers() async {
    await Future.delayed(const Duration(seconds: 3));

    return [
      DemoOffersModel(
          amount: "50%",
          restaurant: "Debonaries Pizza",
          imageURL: "lib/assets/restaurants/maxresdefault.jpg",
          prefix: "ALL PIZZA",
          subfix: "Off",
          expiredOn: "July 21"),
      DemoOffersModel(
          amount: "1",
          restaurant: "Angla Burger",
          imageURL: "lib/assets/restaurants/angla logo.jpg",
          prefix: "BUY GET",
          subfix: "Free",
          expiredOn: "July 15"),
      DemoOffersModel(
          amount: "100",
          restaurant: "Devine Burger",
          imageURL: "lib/assets/restaurants/293502939379531776.jpg",
          prefix: "FREE BIRR",
          subfix: "Coupon",
          expiredOn: "July 21"),
      DemoOffersModel(
          amount: "50%",
          restaurant: "Debonaries Pizza",
          imageURL: "lib/assets/restaurants/maxresdefault.jpg",
          prefix: "ALL PIZZA",
          subfix: "Off",
          expiredOn: "July 21"),
      DemoOffersModel(
          amount: "1",
          restaurant: "Angla Burger",
          imageURL: "lib/assets/restaurants/angla logo.jpg",
          prefix: "BUY GET",
          subfix: "Free",
          expiredOn: "July 15"),
      DemoOffersModel(
          amount: "100",
          restaurant: "Devine Burger",
          imageURL: "lib/assets/restaurants/293502939379531776.jpg",
          prefix: "FREE BIRR",
          subfix: "Coupon",
          expiredOn: "July 21"),
    ];
  }
}
