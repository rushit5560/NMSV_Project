import 'dart:convert';

IntroductionModel introductionModelFromJson(String str) => IntroductionModel.fromJson(json.decode(str));

String introductionModelToJson(IntroductionModel data) => json.encode(data.toJson());

class IntroductionModel {
  IntroductionModel({
    required this.status,
    required this.data,
  });

  String status;
  List<IntroductionData> data;

  factory IntroductionModel.fromJson(Map<String, dynamic> json) => IntroductionModel(
    status: json["status"] ?? "",
    data: List<IntroductionData>.from((json["data"] ?? []).map((x) => IntroductionData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class IntroductionData {
  IntroductionData({
    required this.wigetId,
    required this.wigetName,
    required this.widgetSlug,
    required this.content,
    required this.tempCode,
    required this.isActive,
    required this.createdOn,
    required this.modifiedOn,
    required this.createdBy,
  });

  String wigetId;
  String wigetName;
  String widgetSlug;
  String content;
  String tempCode;
  String isActive;
  DateTime createdOn;
  DateTime modifiedOn;
  String createdBy;

  factory IntroductionData.fromJson(Map<String, dynamic> json) => IntroductionData(
    wigetId: json["WigetId"] ?? "",
    wigetName: json["WigetName"] ?? "",
    widgetSlug: json["widgetSlug"] ?? "",
    content: json["Content"] ?? "",
    tempCode: json["TempCode"] ?? "",
    isActive: json["IsActive"] ?? "",
    createdOn: DateTime.parse(json["CreatedOn"] ?? DateTime.now()),
    modifiedOn: DateTime.parse(json["ModifiedOn"] ?? DateTime.now()),
    createdBy: json["CreatedBy"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "WigetId": wigetId,
    "WigetName": wigetName,
    "widgetSlug": widgetSlug,
    "Content": content,
    "TempCode": tempCode,
    "IsActive": isActive,
    "CreatedOn": createdOn.toIso8601String(),
    "ModifiedOn": modifiedOn.toIso8601String(),
    "CreatedBy": createdBy,
  };
}
