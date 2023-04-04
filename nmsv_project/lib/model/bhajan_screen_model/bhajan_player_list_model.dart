// To parse this JSON data, do
//
//     final bhajanplayerListModel = bhajanplayerListModelFromJson(jsonString);

import 'dart:convert';

BhajanplayerListModel bhajanplayerListModelFromJson(String str) =>
    BhajanplayerListModel.fromJson(json.decode(str));

String bhajanplayerListModelToJson(BhajanplayerListModel data) =>
    json.encode(data.toJson());

class BhajanplayerListModel {
  BhajanplayerListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final BhajanPlayerData data;

  factory BhajanplayerListModel.fromJson(Map<String, dynamic> json) =>
      BhajanplayerListModel(
        status: json["status"] ?? "",
        data: BhajanPlayerData.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "data": data.toJson(),
      };
}

class BhajanPlayerData {
  BhajanPlayerData({
    required this.allBhajanId,
    required this.title,
    required this.isActive,
    // this.tempCode,
    // this.hitCount,
    required this.downloadCount,
    // this.createdOn,
    // this.modifiedOn,
    // this.createdBy,
    required this.bhajans,
  });

  final String allBhajanId;
  final String title;
  final String isActive;
  // final String tempCode;
  // final String hitCount;
  final String downloadCount;
  // final DateTime createdOn;
  // final DateTime modifiedOn;
  // final String createdBy;
  final List<Bhajan> bhajans;

  factory BhajanPlayerData.fromJson(Map<String, dynamic> json) =>
      BhajanPlayerData(
        allBhajanId: json["AllBhajanID"] ?? "",
        title: json["Title"] ?? "",
        isActive: json["IsActive"] ?? "",
        // tempCode: json["TempCode"],
        // hitCount: json["HitCount"],
        downloadCount: json["DownloadCount"] ?? "",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        // modifiedOn: DateTime.parse(json["ModifiedOn"]),
        // createdBy: json["CreatedBy"],
        bhajans: List<Bhajan>.from(
            (json["bhajans"] ?? []).map((x) => Bhajan.fromJson(x ?? {}))),
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
  //     "bhajans": List<dynamic>.from(bhajans.map((x) => x.toJson())),
  // };
}

class Bhajan {
  Bhajan({
    required this.bhajanId,
    required this.bhajanName,
    required this.bhajanFile,
    required this.allBhajanId,
    // this.createdOn,
    required this.mediaUrl,
    required this.src,
    required this.preload,
    required this.title,
  });

  final String bhajanId;
  final String bhajanName;
  final String bhajanFile;
  final String allBhajanId;
  // final DateTime createdOn;
  final String mediaUrl;
  final String src;
  final String preload;
  final String title;

  factory Bhajan.fromJson(Map<String, dynamic> json) => Bhajan(
        bhajanId: json["BhajanID"] ?? "",
        bhajanName: json["BhajanName"] ?? "",
        bhajanFile: json["BhajanFile"] ?? "",
        allBhajanId: json["AllBhajanID"] ?? "",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        mediaUrl: json["MediaURL"] ?? "",
        src: json["src"] ?? "",
        preload: json["preload"] ?? "",
        title: json["title"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //       "BhajanID": bhajanId,
  //       "BhajanName": bhajanName,
  //       "BhajanFile": bhajanFile,
  //       "AllBhajanID": allBhajanId,
  //       "CreatedOn": createdOn.toIso8601String(),
  //       "MediaURL": mediaUrl,
  //       "src": src,
  //       "preload": preload,
  //       "title": title,
  //     };
}
