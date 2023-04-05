// To parse this JSON data, do
//
//     final guruvaniListModel = guruvaniListModelFromJson(jsonString);

import 'dart:convert';

GuruvaniListModel guruvaniListModelFromJson(String str) => GuruvaniListModel.fromJson(json.decode(str));

String guruvaniListModelToJson(GuruvaniListModel data) => json.encode(data.toJson());

class GuruvaniListModel {
    GuruvaniListModel({
        required this.status,
        required this.data,
    });

    final String status;
    final List<GuruvaniListData> data;

    factory GuruvaniListModel.fromJson(Map<String, dynamic> json) => GuruvaniListModel(
        status: json["status"]??"",
        data: List<GuruvaniListData>.from((json["data"]??[]).map((x) => GuruvaniListData.fromJson(x))??{}),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class GuruvaniListData {
    GuruvaniListData({
        required this.allGuruvaniId,
        required this.title,
        required this.isActive,
        required this.tempCode,
        required this.hitCount,
        required this.downloadCount,
        // this.createdOn,
        // this.modifiedOn,
        // this.createdBy,
    });

    final String allGuruvaniId;
    final String title;
    final String isActive;
    final String tempCode;
    final String hitCount;
    final String downloadCount;
    // final DateTime createdOn;
    // final DateTime modifiedOn;
    // final String createdBy;

    factory GuruvaniListData.fromJson(Map<String, dynamic> json) => GuruvaniListData(
        allGuruvaniId: json["AllGuruvaniID"]??"",
        title: json["Title"]??"",
        isActive: json["IsActive"]??"",
        tempCode: json["TempCode"]??"",
        hitCount: json["HitCount"]??"",
        downloadCount: json["DownloadCount"]??"",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        // modifiedOn: DateTime.parse(json["ModifiedOn"]),
        // createdBy: json["CreatedBy"],
    );

    // Map<String, dynamic> toJson() => {
    //     "AllGuruvaniID": allGuruvaniId,
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
