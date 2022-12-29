// To parse this JSON data, do
//
//     final recipient = recipientFromJson(jsonString);

import 'dart:convert';

Recipient recipientFromJson(String str) => Recipient.fromJson(json.decode(str));

String recipientToJson(Recipient data) => json.encode(data.toJson());

class Recipient {
  Recipient({
    this.status,
    this.count,
    this.message,
    this.data,
    this.misc,
  });

  int? status;
  int? count;
  String? message;
  List<Datum>? data;
  Misc? misc;

  factory Recipient.fromJson(Map<String, dynamic> json) => Recipient(
        status: json["status"],
        count: json["count"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        misc: Misc.fromJson(json["misc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "message": message,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : [],
        "misc": misc!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.startYear,
    this.name,
    this.schoolId,
    this.school,
    this.collegeId,
    this.college,
    this.degreeId,
    this.degree,
    this.duration,
    this.remarks,
    this.active,
  });

  int? id;
  int? startYear;
  String? name;
  int? schoolId;
  String? school;
  int? collegeId;
  String? college;
  int? degreeId;
  String? degree;
  String? duration;
  dynamic? remarks;
  int? active;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        startYear: json["StartYear"],
        name: json["Name"],
        schoolId: json["SchoolId"] == null ? null : json["SchoolId"],
        school: json["School"] == null ? null : json["School"],
        collegeId: json["CollegeId"] == null ? null : json["CollegeId"],
        college: json["College"] == null ? null : json["College"],
        degreeId: json["DegreeId"] == null ? null : json["DegreeId"],
        degree: json["Degree"] == null ? null : json["Degree"],
        duration: json["Duration"] == null ? null : json["Duration"],
        remarks: json["Remarks"],
        active: json["Active"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "StartYear": startYear,
        "Name": name,
        "SchoolId": schoolId == null ? null : schoolId,
        "School": school == null ? null : school,
        "CollegeId": collegeId == null ? null : collegeId,
        "College": college == null ? null : college,
        "DegreeId": degreeId == null ? null : degreeId,
        "Degree": degree == null ? null : degree,
        "Duration": duration == null ? null : duration,
        "Remarks": remarks,
        "Active": active,
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
