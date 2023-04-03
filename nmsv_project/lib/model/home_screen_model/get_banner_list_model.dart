// To parse this JSON data, do
//
//     final getBannerListModel = getBannerListModelFromJson(jsonString);

import 'dart:convert';

GetBannerListModel getBannerListModelFromJson(String str) =>
    GetBannerListModel.fromJson(json.decode(str));

String getBannerListModelToJson(GetBannerListModel data) =>
    json.encode(data.toJson());

class GetBannerListModel {
  GetBannerListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<GetBannerList> data;

  factory GetBannerListModel.fromJson(Map<String, dynamic> json) =>
      GetBannerListModel(
        status: json["status"] ?? "",
        data: List<GetBannerList>.from(
          (json["data"] ?? []).map((x) => GetBannerList.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetBannerList {
  GetBannerList({
    required this.bannerId,
    required this.bannerName,
    required this.imageName,
    required this.isActive,
    // required this.tempCode,
    // required this.createdOn,
    // required this.modifiedOn,
    // required this.createdBy,
    required this.imageUrl,
  });

  final String bannerId;
  final String bannerName;
  final String imageName;
  final String isActive;
  // final String tempCode;
  // final DateTime createdOn;
  // final DateTime modifiedOn;
  // final String createdBy;
  final String imageUrl;

  factory GetBannerList.fromJson(Map<String, dynamic> json) => GetBannerList(
        bannerId: json["BannerId"] ?? "",
        bannerName: json["BannerName"] ?? "",
        imageName: json["ImageName"] ?? "",
        isActive: json["IsActive"] ?? "",
        // tempCode: json["TempCode"],
        // createdOn: DateTime.parse(json["CreatedOn"]),
        // modifiedOn: DateTime.parse(json["ModifiedOn"]),
        // createdBy: json["CreatedBy"],
        imageUrl: json["ImageURL"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "BannerId": bannerId,
        "BannerName": bannerName,
        "ImageName": imageName,
        "IsActive": isActive,
        // "TempCode": tempCode,
        // "CreatedOn": createdOn.toIso8601String(),
        // "ModifiedOn": modifiedOn.toIso8601String(),
        // "CreatedBy": createdBy,
        "ImageURL": imageUrl,
      };
}
