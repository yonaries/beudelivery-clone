class DemoOffersModel {
  final String restaurant;
  final String imageURL;
  final String prefix;
  final String subfix;
  final String amount;
  final String expiredOn;

  DemoOffersModel({
    required this.amount,
    required this.restaurant,
    required this.imageURL,
    required this.prefix,
    required this.subfix,
    required this.expiredOn,
  });
}

class DemoOfferDetailsModel {
  final String restaurant;
  final String imageURL;
  final String prefix;
  final String subfix;
  final String amount;
  final String expiredOn;
  final String title;
  final String couponCode;
  final List<String> conditions;

  DemoOfferDetailsModel({
    required this.amount,
    required this.restaurant,
    required this.imageURL,
    required this.prefix,
    required this.subfix,
    required this.expiredOn,
    required this.title,
    required this.couponCode,
    required this.conditions,
  });
}
