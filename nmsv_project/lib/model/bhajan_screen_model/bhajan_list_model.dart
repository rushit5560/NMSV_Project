// To parse this JSON data, do
//
//     final bhajanListModel = bhajanListModelFromJson(jsonString);

import 'dart:convert';

BhajanListModel bhajanListModelFromJson(String str) =>
    BhajanListModel.fromJson(json.decode(str));

String bhajanListModelToJson(BhajanListModel data) =>
    json.encode(data.toJson());

class BhajanListModel {
  BhajanListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<BhajanListData> data;

  factory BhajanListModel.fromJson(Map<String, dynamic> json) =>
      BhajanListModel(
        status: json["status"] ?? "",
        data: List<BhajanListData>.from((json["data"]?? []).map((x) => BhajanListData.fromJson(x ?? {}))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BhajanListData {
  BhajanListData({
    required this.allBhajanId,
    required this.title,
    required this.isActive,
    required this.tempCode,
    required this.hitCount,
    required this.downloadCount,
    // required this.createdOn,
    // required this.modifiedOn,
    required this.createdBy,
  });

  final String allBhajanId;
  final String title;
  final String isActive;
  final String tempCode;
  final String hitCount;
  final String downloadCount;
  // final DateTime createdOn;
  // final DateTime modifiedOn;
  final String createdBy;

  factory BhajanListData.fromJson(Map<String, dynamic> json) => BhajanListData(
        allBhajanId: json["AllBhajanID"] ?? "",
        title: json["Title"] ?? "",
        isActive: json["IsActive"] ?? "",
        tempCode: json["TempCode"] ?? "",
        hitCount: json["HitCount"] ?? "",
        downloadCount: json["DownloadCount"] ?? "",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        // modifiedOn: DateTime.parse(json["ModifiedOn"]),
        createdBy: json["CreatedBy"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "AllBhajanID": allBhajanId,
  //     "Title": title,
  //     "IsActive": isActive,
  //     "TempCode": tempCode,
  //     "HitCount": hitCount,
  //     "DownloadCount": downloadCount,
  //     "CreatedOn": createdOn.toIso8601String(),
  //     "ModifiedOn": modifiedOn.toIso8601String(),
  //     "CreatedBy": createdBy,
  // };
}
