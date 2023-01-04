// To parse this JSON data, do
//
//     final recipientSingle = recipientSingleFromJson(jsonString);

import 'dart:convert';

RecipientSingle recipientSingleFromJson(String str) =>
    RecipientSingle.fromJson(json.decode(str));

String recipientSingleToJson(RecipientSingle data) =>
    json.encode(data.toJson());

class RecipientSingle {
  RecipientSingle({
    this.status,
    this.count,
    this.message,
    this.data,
    this.misc,
  });

  int? status;
  int? count;
  String? message;
  Data? data;
  Misc? misc;

  factory RecipientSingle.fromJson(Map<String, dynamic> json) =>
      RecipientSingle(
        status: json["status"],
        count: json["count"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        misc: Misc.fromJson(json["misc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "message": message,
        "data": data!.toJson(),
        "misc": misc!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.phone,
    this.email,
  });

  int? id;
  String? name;
  String? phone;
  String? email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        name: json["Name"],
        phone: json["Phone"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Phone": phone,
        "Email": email,
      };
}

class Misc {
  Misc({
    this.placeholder,
  });

  String? placeholder;

  factory Misc.fromJson(Map<String, dynamic> json) => Misc(
        placeholder: json["Placeholder"],
      );

  Map<String, dynamic> toJson() => {
        "Placeholder": placeholder,
      };
}
