// ignore: todo
//TODO To parse this JSON data, do
//
//     final itemsModel = itemsModelFromJson(jsonString);

import 'dart:convert';

ItemsModel itemsModelFromJson(String str) =>
    ItemsModel.fromJson(json.decode(str));

String itemsModelToJson(ItemsModel data) => json.encode(data.toJson());

class ItemsModel {
  ItemsModel({
    required this.items,
  });

  List<Item> items;

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.itemId,
    required this.item,
    required this.restaurant,
    required this.price,
    required this.images,
    required this.detail,
    required this.tag,
  });

  String itemId;
  String item;
  String restaurant;
  String price;
  List<String> images;
  String detail;
  List<String> tag;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        item: json["item"],
        restaurant: json["restaurant"],
        price: json["price"],
        images: List<String>.from(json["images"].map((x) => x)),
        detail: json["detail"],
        tag: List<String>.from(json["tag"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "item": item,
        "restaurant": restaurant,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x)),
        "detail": detail,
        "tag": List<dynamic>.from(tag.map((x) => x)),
      };
}
