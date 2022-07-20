// ignore: todo
//TODO To parse this JSON data, do
//
// final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) =>
    RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) =>
    json.encode(data.toJson());

class RestaurantModel {
  RestaurantModel({
    required this.retaurants,
  });

  List<Restaurant> retaurants;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        retaurants: List<Restaurant>.from(
            json["retaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "retaurants": List<dynamic>.from(retaurants.map((x) => x.toJson())),
      };
}

class Restaurant {
  Restaurant({
    required this.restaurant,
    required this.location,
    required this.description,
    required this.images,
    required this.phone,
    required this.mapLocation,
  });

  String restaurant;
  String location;
  String description;
  List<String> images;
  String phone;
  MapLocation mapLocation;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurant: json["restaurant"],
        location: json["location"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        phone: json["phone"],
        mapLocation: MapLocation.fromJson(json["mapLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurant": restaurant,
        "location": location,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "phone": phone,
        "mapLocation": mapLocation.toJson(),
      };
}

class MapLocation {
  MapLocation({
    required this.latitude,
    required this.longtude,
    required this.location,
  });

  String latitude;
  String longtude;
  Location location;

  factory MapLocation.fromJson(Map<String, dynamic> json) => MapLocation(
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
