import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel clientFromJson(String str) => UserModel.fromJson(json.decode(str));

String clientToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String username;
  String email;
  String token;
  String image;
  String cellNumber;
  bool? status;
  bool blocked;
  int role;
  String control;
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.cellNumber,
    this.status,
    required this.token,
    required this.image,

    required this.blocked,
    required this.role,
    required this.control
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      cellNumber: json["cellNumber"],
      token: json["token"],
      image: json["image"],
      status: json["status"],

      blocked: json["blocked"],
      role: json["role"],
  control: json["control"]

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "cellNumber": cellNumber,
    "status":status,
    "token": token,
    "image": image,
    "blocked": blocked,
    "role": role,
    "control": control,

  };
}
