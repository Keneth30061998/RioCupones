// To parse this JSON data, do
//
//     final business = businessFromJson(jsonString);

import 'dart:convert';

Business businessFromJson(String str) => Business.fromJson(json.decode(str));

String businessToJson(Business data) => json.encode(data.toJson());

class Business {
  String? id;
  String? name;
  String? address;
  String? image;

  Business({
    this.id,
    this.name,
    this.address,
    this.image,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "image": image,
      };
}
