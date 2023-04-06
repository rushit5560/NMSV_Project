// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

// String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.status,
    required this.userId,
    required this.userName,
    required this.emailId,
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  final String status;
  final String userId;
  final String userName;
  final String emailId;
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String address;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        status: json["status"] ?? "",
        userId: json["UserID"] ?? "",
        userName: json["UserName"] ?? "",
        emailId: json["EmailId"] ?? "",
        firstName: json["FirstName"] ?? "",
        lastName: json["LastName"] ?? "",
        mobileNo: json["MobileNo"] ?? "",
        address: json["Address"] ?? "",
        city: json["City"] ?? "",
        state: json["State"] ?? "",
        country: json["Country"] ?? "",
        postalCode: json["PostalCode"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //     "status": status,
  //     "UserID": userId,
  //     "UserName": userName,
  //     "EmailId": emailId,
  //     "FirstName": firstName,
  //     "LastName": lastName,
  //     "MobileNo": mobileNo,
  //     "Address": address,
  //     "City": city,
  //     "State": state,
  //     "Country": country,
  //     "PostalCode": postalCode,
  // };
}
