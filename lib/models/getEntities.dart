// To parse this JSON data, do
//
//     final getEntitties = getEntittiesFromJson(jsonString);

import 'dart:convert';

GetEntitties getEntittiesFromJson(String str) =>
    GetEntitties.fromJson(json.decode(str));

String getEntittiesToJson(GetEntitties data) => json.encode(data.toJson());

class GetEntitties {
  String message;
  EntityEvents entityEvents;

  GetEntitties({
    required this.message,
    required this.entityEvents,
  });

  factory GetEntitties.fromJson(Map<String, dynamic> json) => GetEntitties(
        message: json["message"],
        entityEvents: EntityEvents.fromJson(json["entityEvents"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "entityEvents": entityEvents.toJson(),
      };
}

class EntityEvents {
  List<Entity> ongoingEventEntities;
  List<Entity> remainingEntities;

  EntityEvents({
    required this.ongoingEventEntities,
    required this.remainingEntities,
  });

  factory EntityEvents.fromJson(Map<String, dynamic> json) => EntityEvents(
        ongoingEventEntities: List<Entity>.from(
            json["ongoingEventEntities"].map((x) => Entity.fromJson(x))),
        remainingEntities: List<Entity>.from(
            json["remainingEntities"].map((x) => Entity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ongoingEventEntities":
            List<dynamic>.from(ongoingEventEntities.map((x) => x.toJson())),
        "remainingEntities":
            List<dynamic>.from(remainingEntities.map((x) => x.toJson())),
      };
}

class Entity {
  String id;
  String city;
  String entityName;
  String entityType;
  bool isFavourite;

  Entity({
    required this.id,
    required this.city,
    required this.entityName,
    required this.entityType,
    this.isFavourite = false,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        id: json["_id"],
        city: json["city"],
        entityName: json["entityName"],
        entityType: json["entityType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "city": city,
        "entityName": entityName,
        "entityType": entityType,
      };
}
