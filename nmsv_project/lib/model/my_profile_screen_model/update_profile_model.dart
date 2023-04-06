// To parse this JSON data, do
//
//     final updateProfileMOdel = updateProfileMOdelFromJson(jsonString);

import 'dart:convert';

UpdateProfileMOdel updateProfileMOdelFromJson(String str) =>
    UpdateProfileMOdel.fromJson(json.decode(str));

// String updateProfileMOdelToJson(UpdateProfileMOdel data) =>
//     json.encode(data.toJson());

class UpdateProfileMOdel {
  UpdateProfileMOdel({
    required this.status,
    required this.message,
  });

  final String status;
  final String message;

  factory UpdateProfileMOdel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileMOdel(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //     };
}
