// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String message;
  String token;
  UserDetails userDetails;

  Login({
    required this.message,
    required this.token,
    required this.userDetails,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        token: json["token"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  String id;
  String role;
  String firstName;
  String lastName;
  String email;
  String contactNumber;

  UserDetails({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contactNumber,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        role: json["role"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        contactNumber: json["contactNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "contactNumber": contactNumber,
      };
}
