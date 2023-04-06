// To parse this JSON data, do
//
//     final videoListModel = videoListModelFromJson(jsonString);

import 'dart:convert';

VideoListModel videoListModelFromJson(String str) => VideoListModel.fromJson(json.decode(str));

String videoListModelToJson(VideoListModel data) => json.encode(data.toJson());

class VideoListModel {
  VideoListModel({
    required this.status,
    required this.data,
  });
  final String status;
  final List<VideoList> data;
  factory VideoListModel.fromJson(Map<String, dynamic> json) => VideoListModel(
    status: json["status"]??"",
    data: List<VideoList>.from(json["data"].map((x) => VideoList.fromJson(x))??{}),
  );
  Map<String, dynamic> toJson() => {
    "status": status,
    //"data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class VideoList {
  VideoList({
    required this.videoId,
    required this.videoTitle,
    required this.videoUrl,
    required this.isActive,
    required this.tempCode,
    required this.createdOn,
    required this.modifiedOn,
    required this.createdBy,
  });

  final String videoId;
  final String videoTitle;
  final String videoUrl;
  final String isActive;
  final String tempCode;
  final DateTime createdOn;
  final DateTime modifiedOn;
  final String createdBy;

  factory VideoList.fromJson(Map<String, dynamic> json) => VideoList(
    videoId: json["VideoID"]??"",
    videoTitle: json["VideoTitle"]??"",
    videoUrl: json["VideoUrl"]??"",
    isActive: json["IsActive"]??"",
    tempCode: json["TempCode"]??"",
    createdOn: DateTime.parse(json["CreatedOn"]??""),
    modifiedOn: DateTime.parse(json["ModifiedOn"]??""),
    createdBy: json["CreatedBy"],
  );

  // Map<String, dynamic> toJson() => {
  //   "VideoID": videoId,
  //   "VideoTitle": videoTitle,
  //   "VideoUrl": videoUrl,
  //   "IsActive": isActive,
  //   "TempCode": tempCode,
  //   "CreatedOn": createdOn.toIso8601String(),
  //   "ModifiedOn": modifiedOn.toIso8601String(),
  //   "CreatedBy": createdBy,
  // };
}
