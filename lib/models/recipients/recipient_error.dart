// To parse this JSON data, do
//
//     final recipientError = recipientErrorFromJson(jsonString);

import 'dart:convert';

RecipientError recipientErrorFromJson(String str) =>
    RecipientError.fromJson(json.decode(str));

String recipientErrorToJson(RecipientError data) => json.encode(data.toJson());

class RecipientError {
  RecipientError({
    this.status,
    this.message,
    this.data,
    this.misc,
  });

  int? status;
  String? message;
  List<dynamic>? data;
  List<dynamic>? misc;

  factory RecipientError.fromJson(Map<String, dynamic> json) => RecipientError(
        status: json["status"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        misc: List<dynamic>.from(json["misc"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data != null ? List<dynamic>.from(data!.map((x) => x)) : [],
        "misc": misc != null ? List<dynamic>.from(misc!.map((x) => x)) : [],
      };
}
