// To parse this JSON data, do
//
//     final liveOrdersResponse = liveOrdersResponseFromJson(jsonString);

import 'dart:convert';

LiveOrdersResponse liveOrdersResponseFromJson(String str) =>
    LiveOrdersResponse.fromJson(json.decode(str));

String liveOrdersResponseToJson(LiveOrdersResponse data) =>
    json.encode(data.toJson());

class LiveOrdersResponse {
  String message;
  List<LiveOrder> liveOrders;

  LiveOrdersResponse({
    required this.message,
    required this.liveOrders,
  });

  factory LiveOrdersResponse.fromJson(Map<String, dynamic> json) =>
      LiveOrdersResponse(
        message: json["message"],
        liveOrders: List<LiveOrder>.from(
            json["liveOrders"].map((x) => LiveOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "liveOrders": List<dynamic>.from(liveOrders.map((x) => x.toJson())),
      };
}

class LiveOrder {
  String id;
  EntityDetails entityDetails;
  List<Order> orders;
  int orderCount;

  LiveOrder({
    required this.id,
    required this.entityDetails,
    required this.orders,
    required this.orderCount,
  });

  factory LiveOrder.fromJson(Map<String, dynamic> json) => LiveOrder(
        id: json["_id"],
        entityDetails: EntityDetails.fromJson(json["entityDetails"]),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        orderCount: json["orderCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "entityDetails": entityDetails.toJson(),
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "orderCount": orderCount,
      };
}

class EntityDetails {
  String id;
  String city;
  String street;
  String zipcode;
  String entityName;
  String entityType;
  String owner;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  EntityDetails({
    required this.id,
    required this.city,
    required this.street,
    required this.zipcode,
    required this.entityName,
    required this.entityType,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory EntityDetails.fromJson(Map<String, dynamic> json) => EntityDetails(
        id: json["_id"],
        city: json["city"],
        street: json["street"],
        zipcode: json["zipcode"],
        entityName: json["entityName"],
        entityType: json["entityType"],
        owner: json["owner"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "city": city,
        "street": street,
        "zipcode": zipcode,
        "entityName": entityName,
        "entityType": entityType,
        "owner": owner,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Order {
  String id;
  String status;
  List<Item> items;
  int tokenNumber;
  DateTime updatedAt;

  Order({
    required this.id,
    required this.status,
    required this.items,
    required this.tokenNumber,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        status: json["status"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        tokenNumber: json["tokenNumber"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "tokenNumber": tokenNumber,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Item {
  String id;
  String itemId;
  int quantity;

  Item({
    required this.id,
    required this.itemId,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        itemId: json["itemId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemId": itemId,
        "quantity": quantity,
      };
}
