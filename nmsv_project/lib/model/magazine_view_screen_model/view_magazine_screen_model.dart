// To parse this JSON data, do
//
//     final viewPdfMagazineModel = viewPdfMagazineModelFromJson(jsonString);

import 'dart:convert';

ViewPdfMagazineModel viewPdfMagazineModelFromJson(String str) =>
    ViewPdfMagazineModel.fromJson(json.decode(str));

String viewPdfMagazineModelToJson(ViewPdfMagazineModel data) =>
    json.encode(data.toJson());

class ViewPdfMagazineModel {
  ViewPdfMagazineModel({
    required this.status,
    required this.data,
  });

  final String status;
  final ViewPdfMagazine data;

  factory ViewPdfMagazineModel.fromJson(Map<String, dynamic> json) =>
      ViewPdfMagazineModel(
        status: json["status"] ?? "",
        data: ViewPdfMagazine.fromJson(json["data"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        //"data": data.toJson(),
      };
}

class ViewPdfMagazine {
  ViewPdfMagazine({
    required this.magazinepdfTitle,
    required this.month,
    required this.year,
    required this.pdfFile,
    required this.imagename,
    required this.archiveId,
    required this.archiveTitle,
    required this.homeTitleDate,
    required this.sadGurudevTitle,
    required this.sadGurudev,
    required this.regularFeature,
    required this.sadhana,
    required this.ayurvedaTitle,
    required this.ayurveda,
    required this.yogTitle,
    required this.yog,
    required this.stotraTitle,
    required this.stotra,
    required this.special,
    required this.extra,
    required this.image,
    required this.tempCode,
    required this.isActive,
    required this.createdOn,
    required this.modifiedOn,
    required this.createdBy,
    required this.pdfurl,
    required this.imageurl,
  });

  final String magazinepdfTitle;
  final String month;
  final String year;
  final String pdfFile;
  final String imagename;
  final String archiveId;
  final String archiveTitle;
  final String homeTitleDate;
  final String sadGurudevTitle;
  final String sadGurudev;
  final String regularFeature;
  final String sadhana;
  final String ayurvedaTitle;
  final String ayurveda;
  final String yogTitle;
  final String yog;
  final String stotraTitle;
  final String stotra;
  final String special;
  final String extra;
  final String image;
  final String tempCode;
  final String isActive;
  final DateTime createdOn;
  final String modifiedOn;
  final String createdBy;
  final String pdfurl;
  final String imageurl;

  factory ViewPdfMagazine.fromJson(Map<String, dynamic> json) =>
      ViewPdfMagazine(
        magazinepdfTitle: json["MagazinepdfTitle"] ?? "",
        month: json["Month"] ?? "",
        year: json["Year"] ?? "",
        pdfFile: json["PdfFile"] ?? "",
        imagename: json["Imagename"] ?? "",
        archiveId: json["ArchiveId"] ?? "",
        archiveTitle: json["ArchiveTitle"] ?? "",
        homeTitleDate: json["HomeTitleDate"] ?? "",
        sadGurudevTitle: json["SadGurudevTitle"] ?? "",
        sadGurudev: json["SadGurudev"] ?? "",
        regularFeature: json["RegularFeature"] ?? "",
        sadhana: json["Sadhana"] ?? "",
        ayurvedaTitle: json["AyurvedaTitle"] ?? "",
        ayurveda: json["Ayurveda"] ?? "",
        yogTitle: json["YogTitle"] ?? "",
        yog: json["Yog"] ?? "",
        stotraTitle: json["StotraTitle"] ?? "",
        stotra: json["Stotra"] ?? "",
        special: json["Special"] ?? "",
        extra: json["Extra"] ?? "",
        image: json["Image"] ?? "",
        tempCode: json["TempCode"] ?? "",
        isActive: json["IsActive"] ?? "",
        createdOn: DateTime.parse(json["CreatedOn"] ?? ""),
        modifiedOn: json["ModifiedOn"] ?? "",
        createdBy: json["CreatedBy"] ?? "",
        pdfurl: json["pdfurl"] ?? "",
        imageurl: json["imageurl"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //   "MagazinepdfTitle": magazinepdfTitle,
  //   "Month": month,
  //   "Year": year,
  //   "PdfFile": pdfFile,
  //   "Imagename": imagename,
  //   "ArchiveId": archiveId,
  //   "ArchiveTitle": archiveTitle,
  //   "HomeTitleDate": homeTitleDate,
  //   "SadGurudevTitle": sadGurudevTitle,
  //   "SadGurudev": sadGurudev,
  //   "RegularFeature": regularFeature,
  //   "Sadhana": sadhana,
  //   "AyurvedaTitle": ayurvedaTitle,
  //   "Ayurveda": ayurveda,
  //   "YogTitle": yogTitle,
  //   "Yog": yog,
  //   "StotraTitle": stotraTitle,
  //   "Stotra": stotra,
  //   "Special": special,
  //   "Extra": extra,
  //   "Image": image,
  //   "TempCode": tempCode,
  //   "IsActive": isActive,
  //   "CreatedOn": createdOn.toIso8601String(),
  //   "ModifiedOn": modifiedOn,
  //   "CreatedBy": createdBy,
  //   "pdfurl": pdfurl,
  //   "imageurl": imageurl,
  // };
}
