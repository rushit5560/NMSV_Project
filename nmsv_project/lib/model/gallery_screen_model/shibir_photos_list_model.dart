// To parse this JSON data, do
//
//     final galleryPhotosListModel = galleryPhotosListModelFromJson(jsonString);

import 'dart:convert';

GalleryPhotosListModel galleryPhotosListModelFromJson(String str) =>
    GalleryPhotosListModel.fromJson(json.decode(str));

String galleryPhotosListModelToJson(GalleryPhotosListModel data) =>
    json.encode(data.toJson());

class GalleryPhotosListModel {
  GalleryPhotosListModel({
    required this.status,
    required this.data,
  });

  final String status;
  final List<GalleryPhotosList> data;

  factory GalleryPhotosListModel.fromJson(Map<String, dynamic> json) =>
      GalleryPhotosListModel(
        status: json["status"] ?? "",
        data: List<GalleryPhotosList>.from(
            json["data"].map((x) => GalleryPhotosList.fromJson(x)) ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GalleryPhotosList {
  GalleryPhotosList({
    required this.galleryId,
    required this.imageName,
    required this.imageFile,
    required this.shivirGalleryId,
    // required this.createdOn,
    required this.imageUrl,
  });

  final String galleryId;
  final String imageName;
  final String imageFile;
  final String shivirGalleryId;

  // final DateTime createdOn;
  final String imageUrl;

  factory GalleryPhotosList.fromJson(Map<String, dynamic> json) =>
      GalleryPhotosList(
        galleryId: json["GalleryID"] ?? "",
        imageName: json["ImageName"] ?? "",
        imageFile: json["ImageFile"] ?? "",
        shivirGalleryId: json["ShivirGalleryID"] ?? "",
        // createdOn: DateTime.parse(json["CreatedOn"]),
        imageUrl: json["ImageURL"] ?? "",
      );

// Map<String, dynamic> toJson() => {
//   "GalleryID": galleryId,
//   "ImageName": imageName,
//   "ImageFile": imageFile,
//   "ShivirGalleryID": shivirGalleryId,
//   // "CreatedOn": createdOn.toIso8601String(),
//   // "ImageURL": imageUrl,
// };
}
