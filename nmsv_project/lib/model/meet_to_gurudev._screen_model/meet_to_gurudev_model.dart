// To parse this JSON data, do
//
//     final MeetToGurudevModel = MeetToGurudevModelFromJson(jsonString);

import 'dart:convert';

MeetToGurudevModel MeetToGurudevModelFromJson(String str) =>
    MeetToGurudevModel.fromJson(json.decode(str));

String MeetToGurudevModelToJson(MeetToGurudevModel data) =>
    json.encode(data.toJson());

class MeetToGurudevModel {
  MeetToGurudevModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<MeetToGurudecData> data;

  factory MeetToGurudevModel.fromJson(Map<String, dynamic> json) =>
      MeetToGurudevModel(
        status: json["status"] ?? "",
        data: List<MeetToGurudecData>.from(
            (json["data"] ?? []).map((x) => MeetToGurudecData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MeetToGurudecData {
  MeetToGurudecData({
    required this.wigetId,
    required this.wigetName,
    required this.widgetSlug,
    required this.content,
    required this.tempCode,
    required this.isActive,
    // required this.createdOn,
    // required this.modifiedOn,
    required this.createdBy,
  });

  final String wigetId;
  final String wigetName;
  final String widgetSlug;
  final String content;
  final String tempCode;
  final String isActive;
  // final DateTime createdOn;
  // final DateTime modifiedOn;
  final String createdBy;

  factory MeetToGurudecData.fromJson(Map<String, dynamic> json) => MeetToGurudecData(
        wigetId: json["WigetId"] ?? "",
        wigetName: json["WigetName"] ?? "",
        widgetSlug: json["widgetSlug"] ?? "",
        content: json["Content"] ?? "",
        tempCode: json["TempCode"] ?? "",
        isActive: json["IsActive"] ?? "",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        // modifiedOn: DateTime.parse(json["ModifiedOn"]),
        createdBy: json["CreatedBy"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "WigetId": wigetId,
  //     "WigetName": wigetName,
  //     "widgetSlug": widgetSlug,
  //     "Content": content,
  //     "TempCode": tempCode,
  //     "IsActive": isActive,
  //     "CreatedOn": createdOn.toIso8601String(),
  //     "ModifiedOn": modifiedOn.toIso8601String(),
  //     "CreatedBy": createdBy,
  // };
}
