// To parse this JSON data, do
//
//     final previousOrderResponse = previousOrderResponseFromJson(jsonString);

import 'dart:convert';

PreviousOrderResponse previousOrderResponseFromJson(String str) =>
    PreviousOrderResponse.fromJson(json.decode(str));

String previousOrderResponseToJson(PreviousOrderResponse data) =>
    json.encode(data.toJson());

class PreviousOrderResponse {
  String message;
  List<PreviosuOrdersList> previosuOrdersList;

  PreviousOrderResponse({
    required this.message,
    required this.previosuOrdersList,
  });

  factory PreviousOrderResponse.fromJson(Map<String, dynamic> json) =>
      PreviousOrderResponse(
        message: json["message"],
        previosuOrdersList: List<PreviosuOrdersList>.from(
            json["previosuOrdersList"]
                .map((x) => PreviosuOrdersList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "previosuOrdersList":
            List<dynamic>.from(previosuOrdersList.map((x) => x.toJson())),
      };
}

class PreviosuOrdersList {
  int id;
  List<Entity> entities;

  PreviosuOrdersList({
    required this.id,
    required this.entities,
  });

  factory PreviosuOrdersList.fromJson(Map<String, dynamic> json) =>
      PreviosuOrdersList(
        id: json["_id"],
        entities:
            List<Entity>.from(json["entities"].map((x) => Entity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "entities": List<dynamic>.from(entities.map((x) => x.toJson())),
      };
}

class Entity {
  List<Order> orders;
  EntityDetails entityDetails;

  Entity({
    required this.orders,
    required this.entityDetails,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        entityDetails: EntityDetails.fromJson(json["entityDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "entityDetails": entityDetails.toJson(),
      };
}

class EntityDetails {
  String id;
  String entityName;
  String entityType;

  EntityDetails({
    required this.id,
    required this.entityName,
    required this.entityType,
  });

  factory EntityDetails.fromJson(Map<String, dynamic> json) => EntityDetails(
        id: json["_id"],
        entityName: json["entityName"],
        entityType: json["entityType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "entityName": entityName,
        "entityType": entityType,
      };
}

class Order {
  String id;
  String status;
  int tokenNumber;
  List<Item> items;
  String entityId;

  Order({
    required this.id,
    required this.status,
    required this.tokenNumber,
    required this.items,
    required this.entityId,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        status: json["status"],
        tokenNumber: json["tokenNumber"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        entityId: json["entityId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "tokenNumber": tokenNumber,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "entityId": entityId,
      };
}

class Item {
  String id;
  String itemId;
  int quantity;
  ItemDetails itemDetails;

  Item({
    required this.id,
    required this.itemId,
    required this.quantity,
    required this.itemDetails,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        itemId: json["itemId"],
        quantity: json["quantity"],
        itemDetails: ItemDetails.fromJson(json["itemDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemId": itemId,
        "quantity": quantity,
        "itemDetails": itemDetails.toJson(),
      };
}

class ItemDetails {
  String id;
  String itemName;
  String description;
  String type;
  String currency;
  String image;

  ItemDetails({
    required this.id,
    required this.itemName,
    required this.description,
    required this.type,
    required this.currency,
    required this.image,
  });

  factory ItemDetails.fromJson(Map<String, dynamic> json) => ItemDetails(
        id: json["_id"],
        itemName: json["itemName"],
        description: json["description"],
        type: json["type"],
        currency: json["currency"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemName": itemName,
        "description": description,
        "type": type,
        "currency": currency,
        "image": image,
      };
}
