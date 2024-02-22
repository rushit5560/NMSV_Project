// To parse this JSON data, do
//
//     final campScheduleModel = campScheduleModelFromJson(jsonString);

import 'dart:convert';

CampScheduleModel campScheduleModelFromJson(String str) => CampScheduleModel.fromJson(json.decode(str));

String campScheduleModelToJson(CampScheduleModel data) => json.encode(data.toJson());

class CampScheduleModel {
  CampScheduleModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<CampSchedule>? data;

  factory CampScheduleModel.fromJson(Map<String, dynamic> json) => CampScheduleModel(
    status: json["status"]??"",
    data:json["data"] ==null?null: List<CampSchedule>.from(json["data"].map((x) => CampSchedule.fromJson(x))??{}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CampSchedule {
  CampSchedule({
    required this.campScheduleId,
    required this.campScheduleTitle,
    required this.campAddress,
    required this.campDate,
     required this.startDate,
     required this.endDate,
    required this.organiser,
    required this.campMap,
    required this.latitude,
    required this.longitude,
    required this.tempCode,
    required this.isActive,
    required this.createdOn,
    required this.modifiedOn,
    required this.createdBy,
    required this.date,
  });

  final String campScheduleId;
  final String campScheduleTitle;
  final String campAddress;
  final String campDate;
   final DateTime startDate;
   final DateTime endDate;
  final String organiser;
  final String campMap;
  final String latitude;
  final String longitude;
  final String tempCode;
  final String isActive;
  final DateTime createdOn;
  final String modifiedOn;
  final String createdBy;
  final String date;

  factory CampSchedule.fromJson(Map<String, dynamic> json) => CampSchedule(
    campScheduleId: json["CampScheduleID"]??"",
    campScheduleTitle: json["CampScheduleTitle"]??"",
    campAddress: json["CampAddress"]??"",
    campDate: json["CampDate"]??"",
     startDate: DateTime.parse(json["StartDate"]),
     endDate: DateTime.parse(json["EndDate"]),
    organiser: json["Organiser"]??"",
    campMap: json["CampMap"]??"",
    latitude: json["Latitude"]??"",
    longitude: json["Longitude"]??"",
    tempCode: json["TempCode"]??"",
    isActive: json["IsActive"]??"",
    createdOn: DateTime.parse(json["CreatedOn"]),
    modifiedOn: json["ModifiedOn"]??"",
    createdBy: json["CreatedBy"]??"",
    date: json["date"]??"",
  );

  // Map<String, dynamic> toJson() => {
  //   "CampScheduleID": campScheduleId,
  //   "CampScheduleTitle": campScheduleTitle,
  //   "CampAddress": campAddress,
  //   "CampDate": campDate,
  //   // "StartDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
  //   // "EndDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
  //   "Organiser": organiser,
  //   "CampMap": campMap,
  //   "Latitude": latitude,
  //   "Longitude": longitude,
  //   "TempCode": tempCode,
  //   "IsActive": isActive,
  //   //"CreatedOn": createdOn.toIso8601String(),
  //   "ModifiedOn": modifiedOn,
  //   "CreatedBy": createdBy,
  //   "date": date,
  // };
}
