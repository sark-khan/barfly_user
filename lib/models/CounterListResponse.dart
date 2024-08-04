// To parse this JSON data, do
//
//     final counterListResponse = counterListResponseFromJson(jsonString);

import 'dart:convert';

CounterListResponse counterListResponseFromJson(String str) =>
    CounterListResponse.fromJson(json.decode(str));

String counterListResponseToJson(CounterListResponse data) =>
    json.encode(data.toJson());

class CounterListResponse {
  String message;
  List<CounterList> counterLists;

  CounterListResponse({
    required this.message,
    required this.counterLists,
  });

  factory CounterListResponse.fromJson(Map<String, dynamic> json) =>
      CounterListResponse(
        message: json["message"],
        counterLists: List<CounterList>.from(
            json["counterLists"].map((x) => CounterList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "counterLists": List<dynamic>.from(counterLists.map((x) => x.toJson())),
      };
}

class CounterList {
  String id;
  String counterName;
  bool isLive;

  CounterList({
    required this.id,
    required this.counterName,
    required this.isLive,
  });

  factory CounterList.fromJson(Map<String, dynamic> json) => CounterList(
        id: json["_id"],
        counterName: json["counterName"],
        isLive: json["isLive"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "counterName": counterName,
        "isLive": isLive,
      };
}
