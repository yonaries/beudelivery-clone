//TODO To parse this JSON data, do
//
//     final deliveryBoyModel = deliveryBoyModelFromJson(jsonString);

import 'dart:convert';

DeliveryBoyModel deliveryBoyModelFromJson(String str) =>
    DeliveryBoyModel.fromJson(json.decode(str));

String deliveryBoyModelToJson(DeliveryBoyModel data) =>
    json.encode(data.toJson());

class DeliveryBoyModel {
  DeliveryBoyModel({
    required this.deliveryBoys,
  });

  List<DeliveryBoy> deliveryBoys;

  factory DeliveryBoyModel.fromJson(Map<String, dynamic> json) =>
      DeliveryBoyModel(
        deliveryBoys: List<DeliveryBoy>.from(
            json["deliveryBoys"].map((x) => DeliveryBoy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "deliveryBoys": List<dynamic>.from(deliveryBoys.map((x) => x.toJson())),
      };
}

class DeliveryBoy {
  DeliveryBoy({
    required this.deliveryBoyId,
    required this.deliveryBoyFirstName,
    required this.deliveryBoyMiddleName,
    required this.deliveryBoyLastName,
    required this.deliveryBoyMotherName,
    required this.deliveryBoyPhone,
    required this.deliveryBoyPhone2,
    required this.residence,
    required this.nationaIDno,
    required this.passportId,
    required this.photo,
    required this.deliveryBoyAddress,
  });

  String deliveryBoyId;
  String deliveryBoyFirstName;
  String deliveryBoyMiddleName;
  String deliveryBoyLastName;
  String deliveryBoyMotherName;
  String deliveryBoyPhone;
  String deliveryBoyPhone2;
  String residence;
  String nationaIDno;
  String passportId;
  String photo;
  DeliveryBoyAddress deliveryBoyAddress;

  factory DeliveryBoy.fromJson(Map<String, dynamic> json) => DeliveryBoy(
        deliveryBoyId: json["deliveryBoyID"],
        deliveryBoyFirstName: json["deliveryBoyFirstName"],
        deliveryBoyMiddleName: json["deliveryBoyMiddleName"],
        deliveryBoyLastName: json["deliveryBoyLastName"],
        deliveryBoyMotherName: json["deliveryBoyMotherName"],
        deliveryBoyPhone: json["deliveryBoyPhone"],
        deliveryBoyPhone2: json["deliveryBoyPhone2"],
        residence: json["residence"],
        nationaIDno: json["nationaIDno"],
        passportId: json["passportID"],
        photo: json["photo"],
        deliveryBoyAddress:
            DeliveryBoyAddress.fromJson(json["deliveryBoyAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "deliveryBoyID": deliveryBoyId,
        "deliveryBoyFirstName": deliveryBoyFirstName,
        "deliveryBoyMiddleName": deliveryBoyMiddleName,
        "deliveryBoyLastName": deliveryBoyLastName,
        "deliveryBoyMotherName": deliveryBoyMotherName,
        "deliveryBoyPhone": deliveryBoyPhone,
        "deliveryBoyPhone2": deliveryBoyPhone2,
        "residence": residence,
        "nationaIDno": nationaIDno,
        "passportID": passportId,
        "photo": photo,
        "deliveryBoyAddress": deliveryBoyAddress.toJson(),
      };
}

class DeliveryBoyAddress {
  DeliveryBoyAddress({
    required this.city,
    required this.subcity,
    required this.wereda,
  });

  String city;
  String subcity;
  String wereda;

  factory DeliveryBoyAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryBoyAddress(
        city: json["city"],
        subcity: json["subcity"],
        wereda: json["wereda"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "subcity": subcity,
        "wereda": wereda,
      };
}
