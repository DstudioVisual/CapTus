import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Messagesprivated messagesprivatedFromJson(String str) =>
    Messagesprivated.fromJson(json.decode(str));

String messagesprivatedToJson(Messagesprivated data) =>
    json.encode(data.toJson());

class Messagesprivated {
  String id;
  late String iduser;
  late String iduserd;
  late String username;
  late String texto;
  int timestamp;
  late Timestamp fechadecreacion;

  Messagesprivated(
      {required this.id,
        required this.iduser,
        required this.iduserd,
        required this.username,
        required this.texto,
        required this.timestamp,
        required this.fechadecreacion});

  factory Messagesprivated.fromJson(Map<String, dynamic> json) =>
      Messagesprivated(
          id: json["id"],
          iduser: json["iduser"],
          iduserd: json["iduserd"],
          username: json["username"],
          texto: json["texto"],
          timestamp: json["timestamp"],
          fechadecreacion: json["fechadecreacion"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "iduser": iduser,
    "iduserd": iduserd,
    "username": username,
    "texto": texto,
    "timestamp": timestamp,
    "fechadecreacion": fechadecreacion
  };
}
