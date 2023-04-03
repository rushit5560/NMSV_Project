// To parse this JSON data, do
//
//     final galleryListModel = galleryListModelFromJson(jsonString);

import 'dart:convert';

GalleryListModel galleryListModelFromJson(String str) =>
    GalleryListModel.fromJson(json.decode(str));

String galleryListModelToJson(GalleryListModel data) =>
    json.encode(data.toJson());

class GalleryListModel {
  GalleryListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<GalleryList> data;

  factory GalleryListModel.fromJson(Map<String, dynamic> json) =>
      GalleryListModel(
        status: json["status"] ?? "",
        data: List<GalleryList>.from(
            json["data"] .map((x) => GalleryList.fromJson(x))??{}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GalleryList {
  GalleryList({
    required this.shivirGalleryId,
    required this.shivirGalleryTitle,
    required this.isActive,
    required this.tempCode,
    // required this.createdOn,
    // required this.modifiedOn,
    required this.createdBy,
  });

  final String shivirGalleryId;
  final String shivirGalleryTitle;
  final String isActive;
  final String tempCode;

  // final DateTime createdOn;
  // final DateTime modifiedOn;
  final String createdBy;

  factory GalleryList.fromJson(Map<String, dynamic> json) => GalleryList(
        shivirGalleryId: json["ShivirGalleryID"] ?? "",
        shivirGalleryTitle: json["ShivirGalleryTitle"] ?? "",
        isActive: json["IsActive"] ?? "",
        tempCode: json["TempCode"] ?? "",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        // modifiedOn: DateTime.parse(json["ModifiedOn"]),
        createdBy: json["CreatedBy"] ?? "",
      );
//
// Map<String, dynamic> toJson() => {
//   "ShivirGalleryID": shivirGalleryId,
//   "ShivirGalleryTitle": shivirGalleryTitle,
//   "IsActive": isActive,
//   "TempCode": tempCode,
//   "CreatedOn": createdOn.toIso8601String(),
//   "ModifiedOn": modifiedOn.toIso8601String(),
//   "CreatedBy": createdBy,
// };
}
