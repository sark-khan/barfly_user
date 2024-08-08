// To parse this JSON data, do
//
//     final entityLiveOrderResponse = entityLiveOrderResponseFromJson(jsonString);

import 'dart:convert';

EntityLiveOrderResponse entityLiveOrderResponseFromJson(String str) =>
    EntityLiveOrderResponse.fromJson(json.decode(str));

String entityLiveOrderResponseToJson(EntityLiveOrderResponse data) =>
    json.encode(data.toJson());

class EntityLiveOrderResponse {
  String message;
  List<LiveOrderEntity> liveOrders;

  EntityLiveOrderResponse({
    required this.message,
    required this.liveOrders,
  });

  factory EntityLiveOrderResponse.fromJson(Map<String, dynamic> json) =>
      EntityLiveOrderResponse(
        message: json["message"],
        liveOrders: List<LiveOrderEntity>.from(
            json["liveOrders"].map((x) => LiveOrderEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "liveOrders": List<dynamic>.from(liveOrders.map((x) => x.toJson())),
      };
}

class LiveOrderEntity {
  String id;
  String status;
  List<Item> items;
  String counterId;
  String entityId;
  int tokenNumber;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  LiveOrderEntity({
    required this.id,
    required this.status,
    required this.items,
    required this.counterId,
    required this.entityId,
    required this.tokenNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory LiveOrderEntity.fromJson(Map<String, dynamic> json) =>
      LiveOrderEntity(
        id: json["_id"],
        status: json["status"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        counterId: json["counterId"],
        entityId: json["entityId"],
        tokenNumber: json["tokenNumber"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "counterId": counterId,
        "entityId": entityId,
        "tokenNumber": tokenNumber,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Item {
  String id;
  ItemId itemId;
  int quantity;

  Item({
    required this.id,
    required this.itemId,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        itemId: ItemId.fromJson(json["itemId"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemId": itemId.toJson(),
        "quantity": quantity,
      };
}

class ItemId {
  String id;
  String itemName;
  String description;
  String type;
  String currency;
  String image;

  ItemId({
    required this.id,
    required this.itemName,
    required this.description,
    required this.type,
    required this.currency,
    required this.image,
  });

  factory ItemId.fromJson(Map<String, dynamic> json) => ItemId(
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
