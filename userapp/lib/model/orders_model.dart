//TODO To parse this JSON data, do
//
//     final itemsModel = itemsModelFromJson(jsonString);

import 'dart:convert';

OrderModel itemsModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String itemsModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.orders,
  });

  List<Order> orders;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.orderId,
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    required this.paymentMethod,
    required this.paid,
    required this.totalItem,
    required this.deliveryFee,
    required this.deliveryLocation,
    required this.orderDate,
    required this.orderTime,
    required this.orderStatus,
    required this.deliveryBoyId,
    required this.deliveryBoyName,
    required this.deliveryBoyPhone,
    required this.detectedLocation,
    required this.items,
  });

  String orderId;
  String customerId;
  String customerName;
  String customerPhone;
  String paymentMethod;
  String paid;
  String totalItem;
  String deliveryFee;
  String deliveryLocation;
  String orderDate;
  String orderTime;
  String orderStatus;
  String deliveryBoyId;
  String deliveryBoyName;
  String deliveryBoyPhone;
  DetectedLocation detectedLocation;
  List<Item> items;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        customerId: json["customer_id"],
        customerName: json["customerName"],
        customerPhone: json["customerPhone"],
        paymentMethod: json["paymentMethod"],
        paid: json["paid"],
        totalItem: json["totalItem"],
        deliveryFee: json["deliveryFee"],
        deliveryLocation: json["deliveryLocation"],
        orderDate: json["orderDate"],
        orderTime: json["orderTime"],
        orderStatus: json["orderStatus"],
        deliveryBoyId: json["deliveryBoyID"],
        deliveryBoyName: json["deliveryBoyName"],
        deliveryBoyPhone: json["deliveryBoyPhone"],
        detectedLocation: DetectedLocation.fromJson(json["detectedLocation"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "customer_id": customerId,
        "customerName": customerName,
        "customerPhone": customerPhone,
        "paymentMethod": paymentMethod,
        "paid": paid,
        "totalItem": totalItem,
        "deliveryFee": deliveryFee,
        "deliveryLocation": deliveryLocation,
        "orderDate": orderDate,
        "orderTime": orderTime,
        "orderStatus": orderStatus,
        "deliveryBoyID": deliveryBoyId,
        "deliveryBoyName": deliveryBoyName,
        "deliveryBoyPhone": deliveryBoyPhone,
        "detectedLocation": detectedLocation.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class DetectedLocation {
  DetectedLocation({
    required this.latitude,
    required this.longtude,
    required this.location,
  });

  String latitude;
  String longtude;
  Location location;

  factory DetectedLocation.fromJson(Map<String, dynamic> json) =>
      DetectedLocation(
        latitude: json["latitude"],
        longtude: json["longtude"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longtude": longtude,
        "location": location.toJson(),
      };
}

class Location {
  Location({
    required this.country,
    required this.state,
    required this.city,
    required this.street,
  });

  String country;
  String state;
  String city;
  String street;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        country: json["country"],
        state: json["state"],
        city: json["city"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "street": street,
      };
}

class Item {
  Item({
    required this.itemOrderStatus,
    required this.itemId,
    required this.item,
    required this.restaurant,
    required this.price,
    required this.quantity,
  });

  String itemOrderStatus;
  String itemId;
  String item;
  String restaurant;
  String price;
  String quantity;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemOrderStatus: json["itemOrderStatus"],
        itemId: json["item_id"],
        item: json["item"],
        restaurant: json["restaurant"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "itemOrderStatus": itemOrderStatus,
        "item_id": itemId,
        "item": item,
        "restaurant": restaurant,
        "price": price,
        "quantity": quantity,
      };
}
