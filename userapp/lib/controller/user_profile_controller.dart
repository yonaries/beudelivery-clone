import 'package:flutter/cupertino.dart';
import 'package:userapp/model/customerModel.dart';

class UserProfileController extends ChangeNotifier {
  final List<DemoCustomerModel> _customer = [];
  bool _isLoaded = false;

  List<DemoCustomerModel> get customer => _customer;
  bool get isLoaded => _isLoaded;

  onRefresh() {
    _customer.clear();
    getCustomer();
    notifyListeners();
  }

  getCustomer() async {
    final data = await fetchUserData();
    if (_customer.isEmpty) {
      _customer.add(data);
    }
    _isLoaded = true;
    notifyListeners();
  }

  //fetching data
  Future<DemoCustomerModel> fetchUserData() async {
    await Future.delayed(const Duration(seconds: 2));
    return DemoCustomerModel(
        id: "2",
        fullName: "John Doe",
        userName: "john_doe",
        email: "johndoe@gmail.com",
        password: "password",
        phone: "251921095320",
        image: "lib/assets/restaurants/maxresdefault.jpg");
  }
}
