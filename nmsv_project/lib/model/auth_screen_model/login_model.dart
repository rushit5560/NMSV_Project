// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.userId,
    required this.userName,
    required this.emailId,
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
  });

  final String status;
  final String userId;
  final String userName;
  final String emailId;
  final String firstName;
  final String lastName;
  final String mobileNo;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] ?? "",
        userId: json["UserID"] ?? "",
        userName: json["UserName"] ?? "",
        emailId: json["EmailId"] ?? "",
        firstName: json["FirstName"] ?? "",
        lastName: json["LastName"] ?? "",
        mobileNo: json["MobileNo"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "status": status,
  //     "UserID": userId,
  //     "UserName": userName,
  //     "EmailId": emailId,
  //     "FirstName": firstName,
  //     "LastName": lastName,
  //     "MobileNo": mobileNo,
  // };
}
