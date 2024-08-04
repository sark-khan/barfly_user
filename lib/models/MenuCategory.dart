// To parse this JSON data, do
//
//     final menuCategoryResponse = menuCategoryResponseFromJson(jsonString);

import 'dart:convert';

MenuCategoryResponse menuCategoryResponseFromJson(String str) =>
    MenuCategoryResponse.fromJson(json.decode(str));

String menuCategoryResponseToJson(MenuCategoryResponse data) =>
    json.encode(data.toJson());

class MenuCategoryResponse {
  String message;
  List<MenuList> menuLists;

  MenuCategoryResponse({
    required this.message,
    required this.menuLists,
  });

  factory MenuCategoryResponse.fromJson(Map<String, dynamic> json) =>
      MenuCategoryResponse(
        message: json["message"],
        menuLists: List<MenuList>.from(
            json["menuLists"].map((x) => MenuList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "menuLists": List<dynamic>.from(menuLists.map((x) => x.toJson())),
      };
}

class MenuList {
  String id;
  String name;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String entityId;
  String counterId;

  MenuList({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.entityId,
    required this.counterId,
  });

  factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
        id: json["_id"],
        name: json["name"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        entityId: json["entityId"],
        counterId: json["counterId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "icon": icon,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "entityId": entityId,
        "counterId": counterId,
      };
}
