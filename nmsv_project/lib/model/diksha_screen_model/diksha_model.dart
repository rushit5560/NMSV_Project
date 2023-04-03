// To parse this JSON data, do
//
//     final dikshaModel = dikshaModelFromJson(jsonString);

import 'dart:convert';

DikshaModel dikshaModelFromJson(String str) => DikshaModel.fromJson(json.decode(str));

String dikshaModelToJson(DikshaModel data) => json.encode(data.toJson());

class DikshaModel {
  DikshaModel({
    required this.status,
    required this.data,
  });

  String status;
  List<DikshaData> data;

  factory DikshaModel.fromJson(Map<String, dynamic> json) => DikshaModel(
    status: json["status"] ?? "",
    data: List<DikshaData>.from((json["data"] ?? []).map((x) => DikshaData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DikshaData {
  DikshaData({
    required this.cmsId,
    required this.cmsName,
    required this.cmsTitle,
    required this.cmsDescription,
    required this.slug,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeyword,
    required this.menuDisplay,
    required this.isActive,
    required this.createdOn,
    required this.modifiedOn,
    required this.createdBy,
  });

  String cmsId;
  String cmsName;
  String cmsTitle;
  String cmsDescription;
  String slug;
  String metaTitle;
  String metaDescription;
  String metaKeyword;
  String menuDisplay;
  String isActive;
  DateTime createdOn;
  DateTime modifiedOn;
  String createdBy;

  factory DikshaData.fromJson(Map<String, dynamic> json) => DikshaData(
    cmsId: json["CmsId"] ?? "",
    cmsName: json["CmsName"] ?? "",
    cmsTitle: json["CmsTitle"] ?? "",
    cmsDescription: json["CmsDescription"] ?? "",
    slug: json["Slug"] ?? "",
    metaTitle: json["MetaTitle"] ?? "",
    metaDescription: json["MetaDescription"] ?? "",
    metaKeyword: json["MetaKeyword"] ?? "",
    menuDisplay: json["MenuDisplay"] ?? "",
    isActive: json["IsActive"] ?? "",
    createdOn: DateTime.parse(json["CreatedOn"] ?? DateTime.now()),
    modifiedOn: DateTime.parse(json["ModifiedOn"] ?? DateTime.now()),
    createdBy: json["CreatedBy"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "CmsId": cmsId,
    "CmsName": cmsName,
    "CmsTitle": cmsTitle,
    "CmsDescription": cmsDescription,
    "Slug": slug,
    "MetaTitle": metaTitle,
    "MetaDescription": metaDescription,
    "MetaKeyword": metaKeyword,
    "MenuDisplay": menuDisplay,
    "IsActive": isActive,
    "CreatedOn": createdOn.toIso8601String(),
    "ModifiedOn": modifiedOn.toIso8601String(),
    "CreatedBy": createdBy,
  };
}
