// To parse this JSON data, do
//
//     final menuCategoryItem = menuCategoryItemFromJson(jsonString);

import 'dart:convert';

MenuCategoryItem menuCategoryItemFromJson(String str) =>
    MenuCategoryItem.fromJson(json.decode(str));

String menuCategoryItemToJson(MenuCategoryItem data) =>
    json.encode(data.toJson());

class MenuCategoryItem {
  String message;
  List<MenuItem> menuItems;

  MenuCategoryItem({
    required this.message,
    required this.menuItems,
  });

  factory MenuCategoryItem.fromJson(Map<String, dynamic> json) =>
      MenuCategoryItem(
        message: json["message"],
        menuItems: List<MenuItem>.from(
            json["menuItems"].map((x) => MenuItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "menuItems": List<dynamic>.from(menuItems.map((x) => x.toJson())),
      };
}

class MenuItem {
  String id;
  String itemName;
  int price;
  String quantity;
  String description;
  String type;
  int availableQuantity;
  String currency;
  String image;
  String menuCategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  MenuItem({
    required this.id,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.description,
    required this.type,
    required this.availableQuantity,
    required this.currency,
    required this.image,
    required this.menuCategoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        id: json["_id"],
        itemName: json["itemName"],
        price: json["price"],
        quantity: json["quantity"],
        description: json["description"],
        type: json["type"],
        availableQuantity: json["availableQuantity"],
        currency: json["currency"],
        image: json["image"],
        menuCategoryId: json["menuCategoryId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemName": itemName,
        "price": price,
        "quantity": quantity,
        "description": description,
        "type": type,
        "availableQuantity": availableQuantity,
        "currency": currency,
        "image": image,
        "menuCategoryId": menuCategoryId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
