// To parse this JSON data, do
//
//     final guruvaniPlayerModel = guruvaniPlayerModelFromJson(jsonString);

import 'dart:convert';

GuruvaniPlayerModel guruvaniPlayerModelFromJson(String str) =>
    GuruvaniPlayerModel.fromJson(json.decode(str));

String guruvaniPlayerModelToJson(GuruvaniPlayerModel data) =>
    json.encode(data.toJson());

class GuruvaniPlayerModel {
  GuruvaniPlayerModel({
    required this.status,
    required this.data,
  });

  final String status;
  final GuruvaniPlayerDate data;

  factory GuruvaniPlayerModel.fromJson(Map<String, dynamic> json) =>
      GuruvaniPlayerModel(
        status: json["status"] ?? "",
        data: GuruvaniPlayerDate.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "data": data.toJson(),
      };
}

class GuruvaniPlayerDate {
  GuruvaniPlayerDate({
    required this.allGuruvaniId,
    required this.title,
    required this.isActive,
    required this.tempCode,
    required this.hitCount,
    required this.downloadCount,
    // this.createdOn,
    // required this.modifiedOn,
    required this.createdBy,
    required this.guruvanis,
  });

  final String allGuruvaniId;
  final String title;
  final String isActive;
  final String tempCode;
  final String hitCount;
  final String downloadCount;
  // final DateTime createdOn;
  // final DateTime modifiedOn;
  final String createdBy;
  final List<Guruvani> guruvanis;

  factory GuruvaniPlayerDate.fromJson(Map<String, dynamic> json) =>
      GuruvaniPlayerDate(
        allGuruvaniId: json["AllGuruvaniID"] ?? "",
        title: json["Title"] ?? "",
        isActive: json["IsActive"] ?? "",
        tempCode: json["TempCode"] ?? "",
        hitCount: json["HitCount"] ?? "",
        downloadCount: json["DownloadCount"],
        // createdOn: DateTime.parse(json["CreatedOn"]),
        // modifiedOn: DateTime.parse(json["ModifiedOn"]),
        createdBy: json["CreatedBy"] ?? "",
        guruvanis: List<Guruvani>.from(
            (json["guruvanis"] ?? []).map((x) => Guruvani.fromJson(x??{})) ),
      );

  // Map<String, dynamic> toJson() => {
  //     "AllGuruvaniID": allGuruvaniId,
  //     "Title": title,
  //     "IsActive": isActive,
  //     "TempCode": tempCode,
  //     "HitCount": hitCount,
  //     "DownloadCount": downloadCount,
  //     // "CreatedOn": createdOn.toIso8601String(),
  //     // "ModifiedOn": modifiedOn.toIso8601String(),
  //     "CreatedBy": createdBy,
  //     "guruvanis": List<dynamic>.from(guruvanis.map((x) => x.toJson())),
  // };
}

class Guruvani {
  Guruvani({
    required this.guruvaniId,
    required this.allGuruvaniId,
    required this.guruvaniFile,
    // this.createdOn,
    required this.name,
    required this.mediaUrl,
    required this.src,
    required this.preload,
    required this.title,
  });

  final String guruvaniId;
  final String allGuruvaniId;
  final String guruvaniFile;
  // final DateTime createdOn;
  final String name;
  final String mediaUrl;
  final String src;
  final String preload;
  final String title;

  factory Guruvani.fromJson(Map<String, dynamic> json) => Guruvani(
        guruvaniId: json["GuruvaniID"] ?? "",
        allGuruvaniId: json["AllGuruvaniID"] ?? "",
        guruvaniFile: json["GuruvaniFile"] ?? "",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        name: json["Name"] ?? "",
        mediaUrl: json["MediaURL"] ?? "",
        src: json["src"] ?? "",
        preload: json["preload"] ?? "",
        title: json["title"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "GuruvaniID": guruvaniId,
  //     "AllGuruvaniID": allGuruvaniId,
  //     "GuruvaniFile": guruvaniFile,
  //     "CreatedOn": createdOn.toIso8601String(),
  //     "Name": name,
  //     "MediaURL": mediaUrl,
  //     "src": src,
  //     "preload": preload,
  //     "title": title,
  // };
}
