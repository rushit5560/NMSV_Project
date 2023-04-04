/*
import 'dart:convert';

SadhanaListModel sadhanaListModelFromJson(String str) => SadhanaListModel.fromJson(json.decode(str));

String sadhanaListModelToJson(SadhanaListModel data) => json.encode(data.toJson());

class SadhanaListModel {
  SadhanaListModel({
    required this.status,
    required this.data,
  });

  String status;
  List<SadhanaData> data;

  factory SadhanaListModel.fromJson(Map<String, dynamic> json) => SadhanaListModel(
    status: json["status"] ?? "",
    data: List<SadhanaData>.from((json["data"] ?? []).map((x) => SadhanaData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SadhanaData {
  SadhanaData({
    required this.magazineId,
    required this.sadhanaTitle,
    required this.price,
    required this.details,
    required this.date,
    required this.month,
    required this.year,
    required this.createdOn,
    required this.isActive,
    required this.tempCode,
    required this.modifiedOn,
    required this.createdBy,
    required this.images,
  });

  String magazineId;
  String sadhanaTitle;
  String price;
  String details;
  DateTime date;
  String month;
  String year;
  DateTime createdOn;
  String isActive;
  String tempCode;
  DateTime modifiedOn;
  String createdBy;
  List<SadhanaImage> images;

  factory SadhanaData.fromJson(Map<String, dynamic> json) => SadhanaData(
    magazineId: json["MagazineID"] ?? "",
    sadhanaTitle: json["SadhanaTitle"] ?? "",
    price: json["Price"] ?? "",
    details: json["Details"] ?? "",
    date: DateTime.parse(json["Date"] ?? DateTime.now()),
    month: json["Month"] ?? "",
    year: json["Year"] ?? "",
    createdOn: DateTime.parse(json["CreatedOn"] ?? DateTime.now()),
    isActive: json["IsActive"] ?? "",
    tempCode: json["TempCode"] ?? "",
    modifiedOn: DateTime.parse(json["ModifiedOn"] ?? DateTime.now()),
    createdBy: json["CreatedBy"] ?? "",
    images: List<SadhanaImage>.from((json["images"] ?? []).map((x) => SadhanaImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "MagazineID": magazineId,
    "SadhanaTitle": sadhanaTitle,
    "Price": price,
    "Details": details,
    "Date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "Month": month,
    "Year": year,
    "CreatedOn": createdOn.toIso8601String(),
    "IsActive": isActive,
    "TempCode": tempCode,
    "ModifiedOn": modifiedOn.toIso8601String(),
    "CreatedBy": createdBy,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class SadhanaImage {
  SadhanaImage({
    required this.magazineGalleryId,
    required this.imageName,
    required this.imageFile,
    required this.magazineId,
    required this.createdOn,
    required this.mediaUrl,
  });

  String magazineGalleryId;
  String imageName;
  String imageFile;
  String magazineId;
  DateTime createdOn;
  String mediaUrl;

  factory SadhanaImage.fromJson(Map<String, dynamic> json) => SadhanaImage(
    magazineGalleryId: json["MagazineGalleryID"] ?? "",
    imageName: json["ImageName"] ?? "",
    imageFile: json["ImageFile"] ?? "",
    magazineId: json["MagazineID"] ?? "",
    createdOn: DateTime.parse(json["CreatedOn"] ?? DateTime.now()),
    mediaUrl: json["MediaURL"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "MagazineGalleryID": magazineGalleryId,
    "ImageName": imageName,
    "ImageFile": imageFile,
    "MagazineID": magazineId,
    "CreatedOn": createdOn.toIso8601String(),
    "MediaURL": mediaUrl,
  };
}
*/

import 'dart:convert';

SadhanaModel sadhanaModelFromJson(String str) => SadhanaModel.fromJson(json.decode(str));

String sadhanaModelToJson(SadhanaModel data) => json.encode(data.toJson());

class SadhanaModel {
  SadhanaModel({
    required this.status,
    required this.data,
  });

  String status;
  List<SadhanaData> data;

  factory SadhanaModel.fromJson(Map<String, dynamic> json) => SadhanaModel(
    status: json["status"] ?? "",
    data: List<SadhanaData>.from(json["data"].map((x) => SadhanaData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SadhanaData {
  SadhanaData({
    required this.shivirGalleryId,
    required this.title,
    required  this.isActive,
    required this.tempCode,
    required this.createdOn,
    required this.modifiedOn,
    required this.createdBy,
    required this.images,
  });

  String shivirGalleryId;
  String title;
  String isActive;
  String tempCode;
  String createdOn;
  DateTime modifiedOn;
  String createdBy;
  List<SadhanaImage> images;

  factory SadhanaData.fromJson(Map<String, dynamic> json) => SadhanaData(
    shivirGalleryId: json["ShivirGalleryID"],
    title: json["title"],
    isActive: json["IsActive"],
    tempCode: json["TempCode"],
    createdOn: json["CreatedOn"],
    modifiedOn: DateTime.parse(json["ModifiedOn"]),
    createdBy: json["CreatedBy"],
    images: List<SadhanaImage>.from(json["images"].map((x) => SadhanaImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ShivirGalleryID": shivirGalleryId,
    "title": title,
    "IsActive": isActive,
    "TempCode": tempCode,
    "CreatedOn": createdOn,
    "ModifiedOn": modifiedOn.toIso8601String(),
    "CreatedBy": createdBy,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class SadhanaImage {
  SadhanaImage({
    required this.gallryid,
    required this.imageName,
    required this.imageFile,
    required this.shivirGalleryId,
    required  this.createdOn,
    required this.imageUrl,
  });

  String gallryid;
  String imageName;
  String imageFile;
  String shivirGalleryId;
  DateTime createdOn;
  String imageUrl;

  factory SadhanaImage.fromJson(Map<String, dynamic> json) => SadhanaImage(
    gallryid: json["gallryid"],
    imageName: json["ImageName"],
    imageFile: json["ImageFile"],
    shivirGalleryId: json["ShivirGalleryID"],
    createdOn: DateTime.parse(json["CreatedOn"]),
    imageUrl: json["ImageURL"],
  );

  Map<String, dynamic> toJson() => {
    "gallryid": gallryid,
    "ImageName": imageName,
    "ImageFile": imageFile,
    "ShivirGalleryID": shivirGalleryId,
    "CreatedOn": createdOn.toIso8601String(),
    "ImageURL": imageUrl,
  };
}
